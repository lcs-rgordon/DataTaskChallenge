//
//  MessageListView.swift
//  MessageListView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct MessageListView: View {
    
    var messagesByPerson: [String: [Message]] = ["":[]]
    var favourites: Favourites = []
    
    var body: some View {
        List {
            // Iterate over all the keys (each user)
            ForEach(messagesByPerson.keys.sorted(), id:\.self) { person in
                
                // Get messages from this person
                if let messagesFromPerson = messagesByPerson[person]! {
                    
                    // Show a header with the person's name
                    Section(header: Text(person)) {
                        
                        // Show all messages from this person
                        ForEach(messagesFromPerson) { message in
                            
                            HStack {
                                Image(systemName: favourites.contains(message.id) ? "star.fill" : "star")
                                    .foregroundColor(Color.yellow)
                                VStack(alignment: .leading) {
                                    Text(message.message)
                                }
                            }

                        }
                        
                    }

                }
                
                
            }
        }

    }
}

//struct MessageListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageListView()
//    }
//}
