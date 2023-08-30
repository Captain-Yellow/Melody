//
//  ErrorJson.swift
//  Melody
//
//  Created by Mohammad Afshar on 29/08/2023.
//

import Foundation

struct ErroJson: Decodable {
    let data: Data?
    let message: String
    let statusCode: Int
    let result: Bool
    
    enum CodingKeys: String, CodingKey {
        case data
        case message
        case statusCode = "status_code"
        case result
    }
    
    struct Data: Decodable {
        // Add properties here to match the keys and values in the "data" object of your JSON
    }
}
