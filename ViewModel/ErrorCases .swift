//
//  ErrorCases .swift
//  PokedexApp
//
//  Created by Luis Eduardo Ramos on 18/04/2024.
//

import Foundation

enum  APError: Error {
    
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}
