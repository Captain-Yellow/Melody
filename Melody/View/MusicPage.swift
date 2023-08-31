//
//  MusicPage.swift
//  Melody
//
//  Created by Mohammad Afshar on 30/08/2023.
//

import SwiftUI

struct MusicPage: View {
    @ObservedObject var musicInfo = DataManager()
    @GestureState private var dragOffset = CGSize.zero
    @State private var drawerState = false
    @State private var likePopupOpacity = 1.0
    
//    @State private var stackHeight = UIScreen.main.bounds.size.height - 150
    //    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 0) {
                    ZStack {
                        HStack {
                            Button (action: {
                                print("back")
                            })
                            { Image(systemName: "arrow.left")
                                    .padding(.leading, 20)
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            /*
                             Image(systemName: "heart.fill")
                             .foregroundColor(.red)
                             .opacity(likePopupOpacity)
                             .onAppear {
                             DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                             withAnimation {
                             likePopupOpacity = 0
                             }
                             }
                             }
                             Text("Music Liked")
                             .bold()
                             .foregroundColor(.white)
                             .opacity(likePopupOpacity)
                             .onAppear {
                             DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                             withAnimation {
                             likePopupOpacity = 0
                             }
                             }
                             }
                             Spacer()
                             */
                            
                            Button (action: {
                                print("options")
                            }) {
                                Image(systemName: "ellipsis")
                                    .padding(.trailing, 20)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    ZStack(alignment: .center) {
                        /*
                         Rectangle()
                         .fill(Color.gray.opacity(0.2))
                         .cornerRadius(20)
                         .padding(10)
                         .frame(width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.height / 2) - 100, alignment: .center)
                         */
                        AsyncImage(url: URL(string: ImageJson.musicCover/*musicInfo.musicImage*/)) {image in
                            image.resizable()
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(20)
                                .padding(0)
                            //                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.height / 2), alignment: .center)
                        } placeholder: {
                            Image("placeHolderMusicImage")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.accentColor)
                                .cornerRadius(20)
                                .padding(20)
                                .frame(width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.height / 2), alignment: .center)
                            
                        }
                        
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color.black.opacity(0.5), location: 0),
                                .init(color: Color.black.opacity(0.1), location: 1),
                                //                                .init(color: Color.clear, location: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                    .padding(.bottom, 0)
                    
                    MusicInfo()
                        .padding(.top, 0)
                        .onAppear { musicInfo.getMusicInfoRequest(from: Secret.musicApi, parameters: ["content_id": "12", "content_type": "0"])}
                    
                    
                    Divider()
                        .zIndex(0)
                        .frame(width: 1)
                        .foregroundColor(.gray)
                    
                    CurrentMusic()
//                        .onAppear { musicInfo.getMusicInfoRequest(from: Secret.musicApi, parameters: ["content_id": "12", "content_type": "0"])}
                    
                    Divider()
                        .zIndex(0)
                        .frame(width: 1)
                        .foregroundColor(.gray)
                    
//                    MusicPlayer()
//                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                        .frame(width: UIScreen.main.bounds.size.width, height: 50, alignment: .center)
                }
            }.padding(.top, 45)//.frame(height: stackHeight)
            
            /*
             let drag = DragGesture()
             .updating($dragOffset) { dragValue, state, _ in
             state = dragValue.translation
             }
             .onEnded { value in
             if value.translation.height < 0 {
             // Up swipe
             stackHeight = 100
             } else {
             // Down swipe
             stackHeight = UIScreen.main.bounds.size.height - 150
             }
             }
             Text("User Comments")
             .gesture(drag)
             
             UserComments(data: [
             TableRow(image: Constant.imagePLaceHolder, text: "Nice"),
             TableRow(image: Constant.imagePLaceHolder, text: "I Like it"),
             TableRow(image: Constant.imagePLaceHolder, text: "So Beautiful"),
             TableRow(image: Constant.imagePLaceHolder, text: "So Beautiful"),
             TableRow(image: Constant.imagePLaceHolder, text: "So Beautiful"),
             TableRow(image: Constant.imagePLaceHolder, text: "So Beautiful")
             ])
             .padding(.top, 5)
             //            .frame(minHeight: minRowHeight * 9).border(Color.gray)
             //                                                Text("End")
             */
        }
        .background(Color(red: 53/255.0, green: 47/255.0, blue: 68/255.0))
        .edgesIgnoringSafeArea(.all)
    }
}


struct MusicPage_Previews: PreviewProvider {
    static var previews: some View {
        MusicPage()
    }
}
