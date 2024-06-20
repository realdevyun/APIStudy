//
//  TeamNameKorean.swift
//  APIStudy
//
//  Created by John Yun on 6/20/24.
//

import Foundation

enum TeamNameKorean: String {
    
    case daegu = "138107"
    case daejeon = "139785"
    case seoul = "138115"
    case gangwon = "138108"
    case gwangju = "138109"
    case incheon = "138110"
    case jeju = "139078"
    case jeonbuk = "138111"
    case pohang = "138112"
    case gimcheon = "138113"
    case suwon = "139789"
    case ulsan = "138117"
    
    var koreanName: String {
        switch self {
        case .daegu:
            return "대구 FC"
        case .daejeon:
            return "대전 하나 시티즌"
        case .seoul:
            return "FC 서울"
        case .gangwon:
            return "강원 FC"
        case .gwangju:
            return "광주 FC"
        case .incheon:
            return "인천 유나이티드 FC"
        case .jeju:
            return "제주 유나이티드 FC"
        case .jeonbuk:
            return "전북 현대 모터스"
        case .pohang:
            return "포항 스틸러스"
        case .gimcheon:
            return "김천 상무 FC"
        case .suwon:
            return "수원 FC"
        case .ulsan:
            return "울산 HD FC"
        }
    }
}

enum TeamNameShortKorean: String {
    
    case daegu = "138107"
    case daejeon = "139785"
    case seoul = "138115"
    case gangwon = "138108"
    case gwangju = "138109"
    case incheon = "138110"
    case jeju = "139078"
    case jeonbuk = "138111"
    case pohang = "138112"
    case gimcheon = "138113"
    case suwon = "139789"
    case ulsan = "138117"
    
    var koreanName: String {
        switch self {
        case .daegu:
            return "대구"
        case .daejeon:
            return "대전"
        case .seoul:
            return "서울"
        case .gangwon:
            return "강원"
        case .gwangju:
            return "광주"
        case .incheon:
            return "인천"
        case .jeju:
            return "제주"
        case .jeonbuk:
            return "전북"
        case .pohang:
            return "포항"
        case .gimcheon:
            return "김천"
        case .suwon:
            return "수원"
        case .ulsan:
            return "울산"
        }
    }
}
