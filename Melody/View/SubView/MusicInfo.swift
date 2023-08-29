//
//  MusicInfo.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct MusicInfo: View {
    @State private var likeBT = false
    @ObservedObject var musicInfo = DataManager()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack() {
                Text(musicInfo.musicName)
                    .onAppear {
                        musicInfo.postMusicInfoRequest(from: Secret.musicApi, contentId: 12, contentType: 0)
                    }
                    .padding(.leading, 20)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    likeBT.toggle()
                    musicInfo.postLikeRequset(from: Secret.musicApi, contentId: musicInfo.musicId, event: likeBT)
                }) {
                    Image(systemName: likeBT ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(likeBT ? .red : .black)
                }
                .padding(20)
            }
            HStack {
                Text(musicInfo.artistName)
                    .onAppear {
                        musicInfo.postMusicInfoRequest(from: Secret.musicApi, contentId: 12, contentType: 0)
                    }
                    .foregroundColor(.gray)
                    .bold()
                    .padding(.leading, 20)
            }
            HStack {
                Text("Played")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                Text("\(musicInfo.playedNumbers)")
                    .padding(.trailing, 10)
                
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(.gray)
                Text("Likes")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Text("\(musicInfo.likeNumbers)")
                
                Spacer()
                
                Button(action: {
                    print("tapped")
                }) {
                    Image(systemName: "text.badge.plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
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
