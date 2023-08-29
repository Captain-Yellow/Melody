//
//  MusicPlayer.swift
//  Melody
//
//  Created by Mohammad Afshar on 29/08/2023.
//

import SwiftUI
import AVKit

struct MusicPlayer: View {
    @State private var playerState = false
    @State private var sliderValue: Double = 24.0
    
    var body: some View {
        if let url = URL(string: MusicJson.musicLink) {
            let player = AVPlayer(url: url)
            
            //            VideoPlayer(player: AVPlayer(url: url))
            //                .aspectRatio(contentMode: .fit)
            //                .padding()
            
            Button(action: {
                if playerState == false {
                    player.play()
                    playerState = true
                } else {
                    player.pause()
                    playerState = false
                }
            }) {
                Image(systemName: playerState ? "pause" : "play")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
            }
            
            //            VideoPlayerView(videoURL: url)
            //            .frame(height: 300)
            
            
        }
        
        VStack {
                    Slider(value: $sliderValue, in: 0...100)
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
