//
//  APIService.swift
//  APIStudy
//
//  Created by John Yun on 6/18/24.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    let apiKey = "3"
    let baseUrl = "https://www.thesportsdb.com/api/v1/json"
    
    func fetchKLeagueTeams(completion: @escaping (Result<[Team], Error>) -> Void) {
        let url = "\(baseUrl)/\(apiKey)/search_all_teams.php?l=South%20Korean%20K%20League%201"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(TeamResponse.self, from: data)
                    completion(.success(response.teams))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchTeamMatches(teamId: String, completion: @escaping (Result<[Match], Error>) -> Void) {
        let url = "\(baseUrl)/\(apiKey)/eventslast.php?id=\(teamId)"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MatchResponse.self, from: data)
                    completion(.success(response.results))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
