//
//  MusicInfo.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct MusicInfo: View {
    @State private var likeBT = false
    @State private var playedTimes = 3203
    @State private var likedTimes = 2093
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack() {
                Text("Del")
                    .padding(.leading, 20)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    likeBT.toggle()
                }) {
                    Image(systemName: likeBT ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(likeBT ? .red : .black)
                }
                .padding(20)
            }
            HStack {
                Text("Reaza Bahram")
                    .foregroundColor(.gray)
                    .bold()
                    .padding(.leading, 20)
            }
            HStack {
                Text("Played")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
                Text("\(playedTimes)")
                    .padding(.trailing, 10)
                
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(.gray)
                Text("Likes")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Text("\(likedTimes)")
                
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
