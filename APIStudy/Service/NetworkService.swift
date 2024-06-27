//
//  APIService.swift
//  APIStudy
//
//  Created by John Yun on 6/18/24.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProtocol {
    
    let apiKey = "3"
    let baseUrl = "https://www.thesportsdb.com/api/v1/json"
    
    func fetchKLeagueTeams(completion: @escaping (Result<[Team], AppError>) -> Void) {
        let urlString = "\(baseUrl)/\(apiKey)/search_all_teams.php?l=South%20Korean%20K%20League%201"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(TeamResponse.self, from: data)
                    completion(.success(response.teams))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure(let error):
                if let httpStatusCode = response.response?.statusCode {
                    switch httpStatusCode {
                    case 300...399:
                        completion(.failure(.redirectionError(httpStatusCode)))
                    case 400...499:
                        completion(.failure(.clientError(httpStatusCode)))
                    case 500...599:
                        completion(.failure(.serverError(httpStatusCode)))
                    default:
                        completion(.failure(.unknownError))
                    }
                } else {
                    completion(.failure(.networkError(error)))
                }
            }
        }
    }
    
    func fetchTeamMatches(teamId: String, completion: @escaping (Result<[Match], AppError>) -> Void) {
        let urlString = "\(baseUrl)/\(apiKey)/eventslast.php?id=\(teamId)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MatchResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure(let error):
                if let httpStatusCode = response.response?.statusCode {
                    switch httpStatusCode {
                    case 300...399:
                        completion(.failure(.redirectionError(httpStatusCode)))
                    case 400...499:
                        completion(.failure(.clientError(httpStatusCode)))
                    case 500...599:
                        completion(.failure(.serverError(httpStatusCode)))
                    default:
                        completion(.failure(.unknownError))
                    }
                } else {
                    completion(.failure(.networkError(error)))
                }
            }
        }
    }
}
