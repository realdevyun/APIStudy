//
//  NetworkServiceProtocol.swift
//  APIStudy
//
//  Created by John Yun on 6/27/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchKLeagueTeams(completion: @escaping (Result<[Team], AppError>) -> Void)
    func fetchTeamMatches(teamId: String, completion: @escaping (Result<[Match], AppError>) -> Void)
}
