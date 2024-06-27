//
//  TeamViewModel.swift
//  APIStudy
//
//  Created by John Yun on 6/19/24.
//

import Foundation

class TeamViewModel {
    private let networkService: NetworkServiceProtocol
    
    var teams: [Team] = [] {
        didSet {
            didUpdateTeams?()
        }
    }
    
    var didUpdateTeams: (() -> Void)?
    var didFailWithError: ((AppError) -> Void)?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getNetworkService() -> NetworkServiceProtocol {
        return networkService
    }

    func fetchTeams() {
        networkService.fetchKLeagueTeams { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams
            case .failure(let error):
                self?.didFailWithError?(error)
            }
        }
    }
}
