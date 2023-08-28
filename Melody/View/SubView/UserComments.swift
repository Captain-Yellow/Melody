//
//  UserComments.swift
//  Melody
//
//  Created by Mohammad Afshar on 28/08/2023.
//

import SwiftUI

struct TableRow: Identifiable {
    let id = UUID()
    let image: String
    let text: String
}

struct UserComments: View {
    let data: [TableRow]
    
    var body: some View {
        List(data) { row in
            HStack {
                AsyncImage(url: URL(string: row.image)) { image in
                    image.resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    
                } placeholder: {
                    Image(systemName: "person.fill")
                        .frame(width: 50, height: 50)
                }.padding(.trailing, 20)
                
                Text(row.text)
            }
        }
    }
}

struct UserComments_Previews: PreviewProvider {
    
    static var previews: some View {
        UserComments(data: [
            TableRow(image: Constant.imagePLaceHolder, text: "Text 1"),
            TableRow(image: "image2", text: "Text 2"),
            TableRow(image: "image3", text: "Text 3")
        ])
    }
}
