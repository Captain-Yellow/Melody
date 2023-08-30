//
//  ContentView.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var musicInfo = DataManager()
    
    var body: some View {
        TabView {
            MusicPage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.toolbarBackground(Color(red: 53/255.0, green: 47/255.0, blue: 68/255.0), for: .tabBar)
//                .onAppear { musicInfo.getMusicInfoRequest(from: Secret.musicApi, parameters: ["content_id": "12", "content_type": "0"])}
            
            UserComments()
                .tabItem {
                Image(systemName: "rectangle.fill.badge.person.crop")
                Text("User Panel")
            }
            
            tabItem {
                Image(systemName: "square.stack.3d.down.right.fill")
                Text("Category")
            }
            
            tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            
            
        }.background(Color(red: 53/255.0, green: 47/255.0, blue: 68/255.0))
            .edgesIgnoringSafeArea(.all)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
