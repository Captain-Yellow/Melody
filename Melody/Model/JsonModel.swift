//
//  JsonModel.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import Foundation

struct MusicJson: Codable {
    static let musicImage = "https://images.unsplash.com/photo-1517230878791-4d28214057c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2938&q=80"
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

