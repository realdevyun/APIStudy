//
//  Model.swift
//  APIStudy
//
//  Created by John Yun on 6/18/24.
//

import Foundation

struct Match: Decodable {
    let intRound: String?
    let idHomeTeam: String
    let idAwayTeam: String
    let intHomeScore: String?
    let intAwayScore: String?
    let strHomeTeamBadge: String?
    let strAwayTeamBadge: String?
    
    var strHomeTeamKorean: String? {
        return TeamNameShortKorean(rawValue: idHomeTeam)?.koreanName
    }
    
    var strAwayTeamKorean: String? {
        return TeamNameShortKorean(rawValue: idAwayTeam)?.koreanName
    }
}

struct MatchResponse: Decodable {
    let results: [Match]
}
