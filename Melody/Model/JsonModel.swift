//
//  JsonModel.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import Foundation

struct MusicJson: Codable {
    static let musicImage = "https://media.npr.org/assets/music/news/2010/06/eminem-52893634f7c035450a7b5ff2e040cacb4012395e-s1100-c50.jpg"
    static let musicLink = "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8"
}

struct ResponseData: Decodable {
    let data: DataContent
    let message: String?
    let status_code: Int
    let result: Bool
}

struct DataContent: Decodable {
    let id: Int
    let content: Content
    let content_links: ContentLinks
}

struct Content: Decodable {
    let id: Int
    let publish_status: Int
    let artists: [[String]]
    let photo_path: String
    let photo_240_path: String
    let thumbnail_path: String
    let name: String
    let type: Int
    let duration: Double
    let play_number: Int
    let like_number: Int
    let lyrics: String?
    let public_release_date: String
    let artists_id: [Int]
}

struct ContentLinks: Decodable {
    let content_hls_playlist: String
    let content_path_64kbps: String
    let content_path_96kbps: String
    let content_path_128kbps: String
    let content_path_256kbps: String
    let content_path_320kbps: String
    let content_path_m4a_128kbps: String
    let content_path_m4a_256kbps: String
    let content_path_flac: String
}

/*
struct MusicJsonInfo: Decodable {
    var data: data
}

struct data: Decodable {
    var id: Int
    var content: content
}

struct content: Decodable {
    var id: Int
    var artists: [[String]]
    var play_number: Int
    var like_number: Int
}




//var artists: [[String]]
//var naem: String
*/
