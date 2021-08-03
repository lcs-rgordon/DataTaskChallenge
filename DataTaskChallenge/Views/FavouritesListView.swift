//
//  MessageListView.swift
//  MessageListView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct FavouritesListView: View {
    
    @EnvironmentObject private var dataProvider: DataProvider

    var body: some View {
        List {
            // Iterate over all the keys (each sender)
            ForEach(dataProvider.messagesBySender.keys.sorted(), id:\.self) { person in
                
                // Get messages from this sender
                if let messagesFromSender = dataProvider.messagesBySender[person]!.filter({ element in
                    return dataProvider.favourites.contains(element.id)
                }) {
                    
                    if !messagesFromSender.isEmpty {
                        
                        // Show a header with the sender's name
                        Section(header: Text(person)) {
                            
                            // Show all messages from this sender
                            ForEach(messagesFromSender) { message in
                                
                                HStack {
                                    
                                    FavouritesButtonView(message: message)
                                    
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
