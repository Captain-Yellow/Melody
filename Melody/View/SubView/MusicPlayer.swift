//
//  MusicPlayer.swift
//  Melody
//
//  Created by Mohammad Afshar on 29/08/2023.
//

import SwiftUI
import AVKit

struct MusicPlayer: View {
    @ObservedObject var musicInfo = DataManager()
    @State private var playingMusicState = false
    @State internal var currentMusicTimeLine = 24.0
//    @State private var sliderValue: Double = 24.0
    
    var body: some View {
        let safeUrl = URL(string: musicInfo.musicSound)
        let player = AVPlayer(url: safeUrl ?? URL(string: MusicJson.musicLink)!)
        VStack(alignment: .center, spacing: 0) {
            
            ProgressView(value: currentMusicTimeLine, total: 100)
                .tint(.orange)
                .padding([.leading, .trailing], 0)
                .offset(y: +5)
//                .progressViewStyle(CircularProgressViewStyle(tint: .red))
            
            HStack {
                AsyncImage(url: URL(string: musicInfo.musicImage)) { image in
                    image.resizable()
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(5)
                        .padding(.leading, 20)
                        .frame(width: 70, height: 70, alignment: .center)
                } placeholder: {
                    Image("placeHolderMusicImage")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .padding(.leading, 20)
                        .frame(width: 70, height: 70, alignment: .center)
                }
                
                VStack(alignment: .leading, spacing: 9) {
                    Text("Jadeh Royaha")
                        .bold()
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    
                    Text("Reza Bahram")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                }.padding(.trailing, 20)
                
                //            VideoPlayer(player: AVPlayer(url: url))
                //                .aspectRatio(contentMode: .fit)
                //                .padding()
                
                Spacer()
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "backward.end.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                    }
                    
                    Button(action: {
                        if playingMusicState == false {
                            player.play()
                            playingMusicState = true
                        } else {
                            player.pause()
                            playingMusicState = false
                        }
                    }) {
                        Image(systemName: playingMusicState ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "forward.end.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                    }
                    
                    //            VideoPlayerView(videoURL: url)
                    //            .frame(height: 300)
                    
                    //            VStack {
                    //                Slider(value: $sliderValue, in: 0...100)
                    //            }
                }
                .padding(.trailing, 30)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "music.note.list")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                }.padding(.trailing, 20)
            }
            //        .background(.gray)
        }
    }
}

struct VideoPlayerView: UIViewControllerRepresentable {
    var videoURL: URL
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        player.play()
        return playerController
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer().previewLayout(.sizeThatFits)
    }
}
