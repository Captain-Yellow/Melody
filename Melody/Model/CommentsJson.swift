//
//  CommentsJson.swift
//  Melody
//
//  Created by Mohammad Afshar on 29/08/2023.
//

import Foundation

struct Response: Codable {
    let data: [DataItem]
    let message: Message
}

struct DataItem: Codable {
    let id: ID
    let content_id: Int
    let sender_user_id: Int
    let text: String
    let parent_comment_id: String?
    let replies_comment: RepliesComment
    let create_time: DateWrapper
    let update_time: DateWrapper
    let sender_username: String
}

struct ID: Codable {
    let Soid: String
}

struct RepliesComment: Codable {
    let currentLevel: Int
    let currentLevelReplies: [Int]
    let previousLevelReplies: [Int]
}

struct DateWrapper: Codable {
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}

struct Message: Codable {
    let status_code: Int
    let result: Bool
}
