//
//  MessageListView.swift
//  MessageListView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct FavouritesListView: View {
    
    var messagesBySender: [String: [Message]] = ["":[]]
    var favourites: Favourites = []
    
    var body: some View {
        List {
            // Iterate over all the keys (each sender)
            ForEach(messagesBySender.keys.sorted(), id:\.self) { person in
                
                // Get messages from this sender
                if let messagesFromSender = messagesBySender[person]!.filter({ element in
                    return favourites.contains(element.id)
                }) {
                    
                    if !messagesFromSender.isEmpty {
                        
                        // Show a header with the sender's name
                        Section(header: Text(person)) {
                            
                            // Show all messages from this sender
                            ForEach(messagesFromSender) { message in
                                
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

                    }

                }
                
                
            }
        }
        .listStyle(PlainListStyle())

    }
}

//struct FavouritesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesListView()
//    }
//}
