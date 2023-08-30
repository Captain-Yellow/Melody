//
//  UserComments.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI
/*
struct TableRow: Identifiable {
    let id = UUID()
    let image: String
    let text: String
}
*/
struct UserComments: View {
    @ObservedObject var dataManager = DataManager()
    @State private var commentTextField = ""
    
    var body: some View {
        VStack {
            List {
                HStack {
                    ForEach(dataManager.comments, id: \.self) { item in
                        AsyncImage(url: URL(string: Constant.imagePLaceHolder)) { image in
                            image.resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)

                        } placeholder: {
                            Image(systemName: "person.fill")
                                .frame(width: 50, height: 50)
                        }.padding(.trailing, 20)
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text(item)
                                .bold()
                            
                            Text(item)
                        }
                    }
                }
            } .padding(.trailing, 20)
                .onAppear {
                    dataManager.getShowCommentsRequest(from: Secret.musicApi, contentId: 12, parameters: ["content_id" : "12"])
                }
            
            HStack {
                TextField("YourComment", text: $commentTextField)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    dataManager.postCommentRequest(url: Secret.musicApi, text: commentTextField, contentId: dataManager.musicId, senderId: 1, parentCommentId: "\(UUID())", parameters: ["content_id" : "12"])
                }) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.orange)
                }
                .padding(20)
            }
        }
    }
}

struct UserComments_Previews: PreviewProvider {
    static var previews: some View {
        UserComments()
    }
}
