//
//  CoinAPIError.swift
//  networkinginswift
//
//  Created by ke on 2024/5/3.
//

import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid"
        case .jsonParsingFailure: return "json parsing failed"
        case let .requestFailed(description): return "request failed \(description)"
        case let .invalidStatusCode(statusCode): return "status code \(statusCode)"
        case let .unknownError(error): return "\(error.localizedDescription)"
        }
    }
}
