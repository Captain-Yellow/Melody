//
//  MusicInfo.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct MusicInfo: View {
    @State private var likeBT = false
    @State var musicName = "Hli"
    @ObservedObject var musicInfo = DataManager()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack() {
                Text("Place Holder")
                    .onAppear {
                        musicName = musicInfo.musicName
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    likeBT.toggle()
                    musicInfo.postLikeRequset(from: Secret.musicApi, contentId: musicInfo.musicId, event: likeBT)
                }) {
                    Image(systemName: likeBT ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(likeBT ? .red : .white)
                }
                .padding(20)
            }
            HStack {
                Text("Place Holder")
//                    .onAppear {
//                        musicInfo.getMusicInfoRequest(from: Secret.musicApi, parameters: ["content_id": "12", "content_type": "0"])
//                    }
                    .foregroundColor(.gray)
                    .bold()
                    .padding(.leading, 20)
            }
            HStack {
                Text("\(musicInfo.playedNumbers)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                Text("Played")
                    .padding(.trailing, 10)
                    .foregroundColor(.white)
                
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(.gray)
                
                Text("\(musicInfo.likeNumbers)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Text("Likes")
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    musicInfo.getShowCommentsRequest(from: Secret.musicApi, contentId: musicInfo.musicId, parameters: ["content_id" : "12"])
                }) {
                    Image(systemName: "text.badge.plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
                .padding(20)
            }
        }
    }
}

struct MusicInfo_Previews: PreviewProvider {
    static var previews: some View {
        MusicInfo()
    }
}
