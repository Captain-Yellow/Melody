//
//  CurrentMusic.swift
//  Melody
//
//  Created by Mohammad Afshar on 30/08/2023.
//

import SwiftUI

struct CurrentMusic: View {
    @ObservedObject var dataManager = DataManager()
    
    var body: some View {
        HStack {
            ZStack {
                AsyncImage(url: URL(string: dataManager.musicImage)) {image in
                    image.resizable()
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(5)
                        .padding(.leading, 20)
                        .padding(0)
                        .frame(width: 70, height: 70, alignment: .center)
                } placeholder: {
                    Image("placeHolderMusicImage")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .padding(.leading, 20)
                        .frame(width: 70, height: 70, alignment: .center)
                }
                
                Image(systemName: "play.fill")
                    .foregroundColor(.orange)
                    .padding(.leading, 20)
            }
            
            VStack {
                Text("\(dataManager.musicName)")
                    .bold()
                    .foregroundColor(.white)
                
                Text("\(dataManager.artistName)")
                    .foregroundColor(.white)
            }.padding(.leading, 20)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }.padding(.trailing, 20)
        }
    }
}

struct CurrentMusic_Previews: PreviewProvider {
    static var previews: some View {
        CurrentMusic()
    }
}
