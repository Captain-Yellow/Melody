//
//  DataManagerVM.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import Foundation


class DataManager: ObservableObject {
    @Published var musicId: Int = 0
    @Published var musicName: String = ""
    @Published var musicImage: String = ""
    @Published var artistName: String = ""
    @Published var musicSound: String = ""
    @Published var likeMessage: String = ""
    @Published var likeNumbers: Int = 0
    @Published var playedNumbers: Int = 0
    @Published var likeState: Bool = false
    @Published var comments = [String]()
    
    func getMusicInfoRequest(from url: String, parameters: [String: String]) {
        var urlComponents = URLComponents(string: url+Secret.getMusicInfo)!
        urlComponents.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        let request = URLRequest(url: urlComponents.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "error")
                return
            }
            
            let parsedJson = self.parseJson(jsonData: data)
            DispatchQueue.main.async {
                self.musicId = parsedJson?.data.id ?? 0
                self.musicName = parsedJson?.data.content.name ?? "nil"
                self.musicImage = parsedJson?.data.content.photo_path ?? "nil"
                self.musicSound = parsedJson?.data.content_links.content_hls_playlist ?? "nil"
                self.artistName = parsedJson?.data.content.artists[0][0] ?? "nil"
                self.likeNumbers = parsedJson?.data.content.like_number ?? 0
                self.playedNumbers = parsedJson?.data.content.play_number ?? 0
            }
        }
        task.resume()
    }
    
    func postLikeRequset(from url: String, contentId: Int, event: Bool) {
        var request: URLRequest? = nil
        if event {
            if let url = URL(string: url+(Secret.musicLikeApi+"\(contentId)/")) {
                request = URLRequest(url: url)
            }
        } else {
            if let url = URL(string: url+(Secret.musicUnlikeApi+"\(contentId)/")) {
                request = URLRequest(url: url)
            }
        }
        
        request?.httpMethod = event ? "POST" : "DELETE"
        
        let task = URLSession.shared.dataTask(with: request!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    print("statusCode : \(httpResponse.statusCode)")
                }
            }
            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(ErroJson.self, from: data)
                    DispatchQueue.main.async {
                        self.likeState = true
                        self.likeMessage = responseData.message
                    }
                } catch {
                    print("error \(error)")
                }
            } else {
                print("error-postLikeRequset-jsonDecode response-data condition")
            }
        }
        task.resume()
    }
    
    func getShowCommentsRequest(from url: String, contentId: Int, parameters: [String: String]) {
        var urlComponents = URLComponents(string: url+Secret.musicShowComments+"\(contentId)")!
        urlComponents.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        let request = URLRequest(url: urlComponents.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "error")
                return
            }
            do {
                let responseData = try JSONDecoder().decode(CommentsJson.self, from: data)
                responseData.data.count
                for item in responseData.data {
                    print(item.text)
                    DispatchQueue.main.async {
                        self.comments.append(item.text)
                    }
                }
            } catch {
                print("error \(error)")
            }
            
        }
        task.resume()
    }
    
    func postCommentRequest(url: String, text: String, contentId: Int, senderId: Int, parentCommentId: String, parameters: [String: String]) {
        var urlComponents = URLComponents(string: url+Secret.musicAddComments+"\(contentId)")!
        urlComponents.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "POST"
        
//        let message = SendCumment(text: text, senderUserID: senderId, parentCommentID: parentCommentId)
//        let jsonData = try! JSONEncoder().encode(message)
        
        let jsonDict: [String : Any] = ["text" : "\(text)", "sender_user_id" : 1, "parent_comment_id" : "\(UUID())"]
//        let validCheck = try! JSONSerialization.isValidJSONObject(jsonData)
        let bodyJsonData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyJsonData  // text.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "error")
                return
            }
            print(String(data: data, encoding: .utf8))
        }
        task.resume()
    }
    
    func parseJson(jsonData: Data) -> ResponseData? {
        let jsonDecoder = JSONDecoder()
        do {
            let responseData = try jsonDecoder.decode(ResponseData.self, from: jsonData)
            return responseData
        } catch {
            print("error \(error)")
        }
        return nil
    }
    
}
