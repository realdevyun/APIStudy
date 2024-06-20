//
//  TeamModel.swift
//  APIStudy
//
//  Created by John Yun on 6/19/24.
//

import Foundation

struct Team: Decodable {
    let idTeam: String
    let strBadge: String?
    
    var strTeamKorean: String? {
        return TeamNameKorean(rawValue: idTeam)?.koreanName
    }
}

struct TeamResponse: Decodable {
    let teams: [Team]
}
