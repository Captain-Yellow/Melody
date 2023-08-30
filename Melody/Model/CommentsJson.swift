//
//  CommentsJson.swift
//  Melody
//
//  Created by Mohammad Afshar on 29/08/2023.
//

import Foundation

struct CommentsJson: Decodable {
    let data: [Comment]
    let message: String
    let statusCode: Int
    let result: Bool

    enum CodingKeys: String, CodingKey {
        case data, message
        case statusCode = "status_code"
        case result
    }
}

struct Comment: Decodable {
    let id: ID
    let contentID: Int
    let senderUserID: Int
    let text: String
    let parentCommentID: Int?
    let repliesComment: RepliesComment
    let createTime: DateValue
    let updateTime: DateValue
    let senderUsername: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case contentID = "content_id"
        case senderUserID = "sender_user_id"
        case text
        case parentCommentID = "parent_comment_id"
        case repliesComment = "replies_comment"
        case createTime = "create_time"
        case updateTime = "update_time"
        case senderUsername = "sender_username"
    }
}

struct ID: Decodable {
    let oid: String

    enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}

struct RepliesComment: Decodable {
    let currentLevel: Int
    let currentLevelReplies: [String]
    let previousLevelReplies: [String]
}

struct DateValue: Decodable {
    let date: String

    enum CodingKeys: String, CodingKey {
        case date = "$date"
    }
}



class SendCumment: Encodable {
    let text: String
    let senderUserID: Int
    let parentCommentID: String
    
    init(text: String, senderUserID: Int, parentCommentID: String) {
        self.text = text
        self.senderUserID = senderUserID
        self.parentCommentID = parentCommentID
        }
}

//extension SendCumment {
//    func toDictionary() -> [String: Any] {
//        let mirror = Mirror(reflecting: self)
//        var result = [String : Any]
//        for child in mirror.children {
//            if let label = child.label {
//                result[label] = child.value
//            }
//        }
//        return result
//    }
//}
