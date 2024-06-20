//
//  MatchViewModel.swift
//  APIStudy
//
//  Created by John Yun on 6/19/24.
//

import Foundation

class MatchViewModel {
    var matches: [Match] = []
    var didUpdateMatches: (() -> Void)?

    func fetchMatches(teamId: String) {
        NetworkService.shared.fetchTeamMatches(teamId: teamId) { [weak self] result in
            switch result {
            case .success(let matches):
                self?.matches = matches
                self?.didUpdateMatches?()
            case .failure(let error):
                print("Error fetching matches: \(error)")
            }
        }
    }
}
