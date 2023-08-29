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
    @Published var artistName: String = ""
    @Published var likeNumbers: Int = 0
    @Published var playedNumbers: Int = 0
    @Published var likeState: Bool = false
    @Published var comments = [DataItem]()
    /*
     func getMusicRequest(from url: String) {
     if let apiUrl = URL(string: url) {
     let urlSession = URLSession(configuration: .default)
     let task = urlSession.dataTask(with: apiUrl) { data, response, error in
     if error != nil {
     return
     }
     if let jsonData = data {
     _ = self.parseJson(jsonData: jsonData)
     }
     }
     task.resume()
     }
     }
     */
    func postMusicInfoRequest(from url: String, contentId: Int, contentType: Int) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("content_id", forHTTPHeaderField: "\(contentId)")
            request.setValue("content_type", forHTTPHeaderField: "\(contentType)")
            
            //            request.allHTTPHeaderFields = ["Content-Type": "application/json"]
            //            let body = ["key1": "value1", "key2": "value2"]
            //            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    // Handle error
                    print(error?.localizedDescription ?? "error")
                    return
                }
                
                let parsedJson = self.parseJson(jsonData: data)
                //                print(parsedJson?.data.content.artists.first?.first)
                DispatchQueue.main.async {
                    self.musicId = parsedJson?.data.id ?? 0
                    self.musicName = parsedJson?.data.content.name ?? "nil"
                    self.artistName = parsedJson?.data.content.artists[0][0] ?? "nil"
                    self.likeNumbers = parsedJson?.data.content.like_number ?? 0
                    self.playedNumbers = parsedJson?.data.content.play_number ?? 0
                }
                //                print(parsedJson?.data.content.like_number)
                //                print(parsedJson?.data.content.play_number)
                // Handle response data
                //                if let responseString = String(data: data, encoding: .utf8) {
                //                    print(responseString)
                //                }
                //                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                //                        }
            }
            
            task.resume()
        }
    }
    
    func postLikeRequset(from url: String, contentId: Int, event: Bool) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = event ? "POST" : "DELETE"
            request.allHTTPHeaderFields = ["Content-id": "\(contentId)"]
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    print("statusCode : \(statusCode)")
                }
            }
            task.resume()
        }
    }
    
    func postShowCommentsRequest(from url: String, contentId: Int) {
        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = ["Content-id": "\(contentId)"]
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    let jsonComments = """
                    {
                        "data": [
                            {
                                "id": {
                                    "Soid": "6499777bf8fcb201d13dd36d"
                                },
                                "content_id": 12,
                                "sender_user_id": 882,
                                "text": "ja",
                                "parent_comment_id": null,
                                "replies_comment": {
                                    "currentLevel": -1,
                                    "currentLevelReplies": [1],
                                    "previousLevelReplies": []
                                },
                                "create_time": {
                                    "$date": "2023-06-26T15:03:15.4657"
                                },
                                "update_time": {
                                    "$date": "2023-06-26T15:03:15.4657"
                                },
                                "sender_username": "melody_melodio"
                            }
                        ],
                        "message": {
                            "status_code": 200,
                            "result": true
                        }
                    }
                    """
                    
                    let jsonData = jsonComments.data(using: .utf8)!
                    do {
                        let responseData = try JSONDecoder().decode(Response.self, from: jsonData)
                        print(responseData.data.count)
                        DispatchQueue.main.async {
                            self.comments = responseData.data
                        }
                    } catch {
                        print("error \(error)")
                    }
                }
            }
            task.resume()
        }
    }
        
        func parseJson(jsonData: Data) -> ResponseData? {
            let jsonDecoder = JSONDecoder()
            do {
                //            let decodedJson = try jsonDecoder.decode(MusicJsonInfo.self, from: jsonData)
                let jsonMusicInfo = """
                    {
                      "data": {
                        "id": 12,
                        "content": {
                          "id": 12,
                          "publish_status": 1,
                          "artists": [
                            [
                              "Amir Yeganeh"
                            ]
                          ],
                          "photo_path": "https......",
                          "photo_240_path": "https....",
                          "thumbnail_path": "https....",
                          "name": "To Bedoon Ino",
                          "type": 0,
                          "duration": 221.65,
                          "play_number": 1,
                          "like_number": 0,
                          "lyrics": null,
                          "public_release_date": "2023-02-27T04:58:10.340118+03:30",
                          "artists_id": [
                            165
                          ]
                        },
                        "content_links": {
                          "content_hls_playlist": "https://...... ",
                          "content_path_64kbps": "https:/.......",
                          "content_path_96kbps": "https://.......",
                          "content_path_128kbps": "https://........",
                          "content_path_256kbps": "https://........",
                          "content_path_320kbps": "",
                          "content_path_m4a_128kbps": "https://c....",
                          "content_path_m4a_256kbps": "https://.......",
                          "content_path_flac": ""
                        }
                      },
                      "message": null,
                      "status_code": 200,
                      "result": true
                    }
                    """
                
                let jsonData = jsonMusicInfo.data(using: .utf8)!
                
                let responseData = try jsonDecoder.decode(ResponseData.self, from: jsonData)
                print("decoded")
                return responseData
            } catch {
                print("error \(error)")
            }
            print("nillo")
            return nil
        }
        
        func checkImageUrl() {
            
        }
    }
