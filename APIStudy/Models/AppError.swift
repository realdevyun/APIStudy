//
//  Error.swift
//  APIStudy
//
//  Created by John Yun on 6/26/24.
//

import Foundation

import Foundation

enum AppError: LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case networkError(Error)
    case clientError(Int)
    case serverError(Int)
    case redirectionError(Int)
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다."
        case .noData:
            return "데이터를 불러올 수 없습니다."
        case .decodingError:
            return "데이터를 처리하는 데 실패했습니다."
        case .networkError(let error):
            return "네트워크 에러: \(error.localizedDescription)"
        case .clientError(let statusCode):
            return "클라이언트 에러: \(statusCode)"
        case .serverError(let statusCode):
            return "서버 에러: \(statusCode)"
        case .redirectionError(let statusCode):
            return "리다이렉션 에러: \(statusCode)"
        case .unknownError:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
