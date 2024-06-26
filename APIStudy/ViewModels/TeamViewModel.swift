//
//  TeamViewModel.swift
//  APIStudy
//
//  Created by John Yun on 6/19/24.
//

import Foundation

class TeamViewModel {
    var teams: [Team] = [] {
        didSet {
            didUpdateTeams?()
        }
    }
    
    var didUpdateTeams: (() -> Void)?
    var didFailWithError: ((AppError) -> Void)?

    func fetchTeams() {
        NetworkService.shared.fetchKLeagueTeams { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams
            case .failure(let error):
                self?.didFailWithError?(error)
            }
        }
    }
}
