//
//  GroupChatListView.swift
//  GroupChatListView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct GroupChatListView: View {
    
    var messages: [Message] = []
    var favourites: Favourites = []
    
    var body: some View {
        
        List(messages.filter({ element in
            return true
        })) { message in
            VStack(alignment: .leading) {
                Text(message.from)
                    .font(.caption)
                    .bold()
                Spacer()
                HStack {
                    Image(systemName: favourites.contains(message.id) ? "star.fill" : "star")
                        .foregroundColor(Color.yellow)
                    VStack(alignment: .leading) {
                        Text(message.message)
                    }
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.primary.colorInvert())
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .listStyle(PlainListStyle())
    }
}

struct GroupChatListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatListView()
    }
}
