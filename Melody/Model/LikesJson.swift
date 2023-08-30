//
//  LikesJson.swift
//  Melody
//
//  Created by Mohammad Afshar on 29/08/2023.
//

import Foundation

struct LikesJson: Decodable {
    let data: Data
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
        let id: Int
        let userId: Int
        let content: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case userId = "user id"
            case content
        }
    }
}
