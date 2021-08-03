//
//  ContentView.swift
//  DataTaskChallenge
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: User = User(id: UUID(), name: "Patrick Stewart", age: 81)
    @State private var messages: [Message] = []
    @State private var messagesBySender: [String: [Message]] = ["":[]]
    @State private var favourites: Favourites = []
    
    var body: some View {
        TabView {
            NavigationView {
                
                VStack {
                    HeaderView(name: user.name, age: user.age)
                    GroupChatListView(messages: messages,
                                      favourites: favourites)
                    
                }
                .navigationTitle("Group Chat")
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
            }
            
            NavigationView {
                
                VStack {
                    HeaderView(name: user.name, age: user.age)
                    FavouritesListView(messagesBySender: messagesBySender,
                                       favourites: favourites)
                }
                .navigationTitle("Favourites")

            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favourites")
            }
            
        }
        .task {
            do {
                
                let userURL = URL(string: "https://www.hackingwithswift.com/samples/user-24601.json")!
                let messagesURL = URL(string: "https://www.hackingwithswift.com/samples/user-messages.json")!
                let favouritesURL = URL(string: "https://www.hackingwithswift.com/samples/user-favorites.json")!
                
                async let userData: User = URLSession.shared.decode(from: userURL)
                async let messagesData: [Message] = URLSession.shared.decode(from: messagesURL)
                async let favouritesData: Favourites = URLSession.shared.decode(from: favouritesURL)
                
                // Wait for user information
                user = try await userData
                
                // Wait for messages information
                messages = try await messagesData
                print("There are \(messages.count) messages.")

                // Now group messages by sender
                let unsortedMessages = messages
                let messagesBySender = Dictionary(grouping: unsortedMessages, by: { message in
                    message.from
                })
                self.messagesBySender = messagesBySender
                print("Messages, grouped by person who sent them:")
                print(String(describing: messagesBySender))
                
                // Wait for favourites data
                favourites = try await favouritesData
                
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
