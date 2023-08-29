//
//  ContentView.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var drawerState = false
    @State private var stackHeight = UIScreen.main.bounds.size.height - 150
    //    @Environment(\.defaultMinListRowHeight) var minRowHeight

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 0) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                            .padding(10)
                            .frame(width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.height / 2) - 100, alignment: .center)
                        
                        AsyncImage(url: URL(string: MusicJson.musicImage)) {image in
                            image.resizable()
                                .scaledToFit()
                                .imageScale(.medium)
                                .foregroundColor(.accentColor)
                                .cornerRadius(20)
                                .padding(20)
                                .aspectRatio(contentMode: .fit)
                            //                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.height / 2)-100, alignment: .center)
                        } placeholder: {
                            Image("placeHolderMusicImage")
                                .resizable()
                                .scaledToFit()
                                .imageScale(.medium)
                                .foregroundColor(.accentColor)
                                .cornerRadius(20)
                                .padding(20)
                                .frame(width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.height / 2), alignment: .center)
                        }
                    }
                    .padding(.bottom, 0)
                    
                    MusicInfo()
                        .padding(.top, 0)
                    
                    Divider()
                    
                }
                
                MusicPlayer()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .frame(width: UIScreen.main.bounds.size.width, height: 50, alignment: .center)
                
            }.frame(height: stackHeight)
            
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
