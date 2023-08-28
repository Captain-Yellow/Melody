//
//  DataManagerVM.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import Foundation

class DataManager {
    
    func getMusicRequest(from url: String) {
        if let apiUrl = URL(string: url) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: apiUrl) { data, response, error in
                if error != nil {
                    return
                }
                if let jsonData = data {
                    
                }
            }
                task.resume()
        }
    }
    
    func postMusicRequest(from url: String) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
        }
    }
    
    func parseJson(jsonData: Data) {
        let jsonDecoder = JSONDecoder()
        do {
            let decodedJson = try jsonDecoder.decode(MusicJson.self, from: jsonData)
        } catch {
            print("error \(error)")
        }
    }
    
    func checkImageUrl() {
        
    }
}
