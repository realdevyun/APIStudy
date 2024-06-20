//
//  TeamViewModel.swift
//  APIStudy
//
//  Created by John Yun on 6/19/24.
//

import Foundation

class TeamViewModel {
    var teams: [Team] = []
    var didUpdateTeams: (() -> Void)?

    func fetchTeams() {
        NetworkService.shared.fetchKLeagueTeams { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams
                self?.didUpdateTeams?()
            case .failure(let error):
                print("Error fetching teams: \(error)")
            }
        }
    }
}
