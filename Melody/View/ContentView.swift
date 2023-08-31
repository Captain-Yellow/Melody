//
//  ContentView.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var musicInfo = DataManager()
    @State internal var drawerMusicPlayer: Bool = true
    @State var selectedTab: Int = 0
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    MusicPage()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .tag(0)
                        .toolbarBackground(Color(red: 53/255.0, green: 47/255.0, blue: 68/255.0), for: .tabBar)
                    //                .onAppear { musicInfo.getMusicInfoRequest(from: Secret.musicApi, parameters: ["content_id": "12", "content_type": "0"])}
                    
                    UserComments()
                        .tabItem {
                            Image(systemName: "rectangle.fill.badge.person.crop")
                            Text("User Panel")
                        }
                        .tag(1)
                    
                    Category()
                        .tabItem {
                            Image(systemName: "square.stack.3d.down.right.fill")
                            Text("Category")
                        }
                        .tag(2)
                    
                    Profile()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(3)
                    
                    
                }.background(Color(red: 53/255.0, green: 47/255.0, blue: 68/255.0))
                    .edgesIgnoringSafeArea(.all)
                
                //                Color.red
                //                    .frame(width: geo.size.width, height: 110, alignment: .center)
                
                //                Rectangle()
                //                    .background(Color.red)
                //                    .frame(width: geo.size.width, height: 222, alignment: .center)
                if drawerMusicPlayer {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(LinearGradient(
                                    colors: [Color(red: 77/255, green: 25/255, blue: 183/255),
                                             Color(red: 14/255, green: 33/255, blue: 160/255)],
                                    startPoint: .leading, endPoint: .trailing))
                                .colorMultiply(Color.white.opacity(0.5))
                                .frame(width: geo.size.width, height: 60, alignment: .center)
                                .border(Color(red: 77/255, green: 25/255, blue: 183/255), width: 2)
                                .cornerRadius(15)
                            
                            MusicPlayer()
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            //                        .frame(width: geo.size.width, height: 100, alignment: .center)
                        }
                    }
                    .offset(y: -44)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
