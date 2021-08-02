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
    @State private var favourites: Favourites = []
    
    var body: some View {
        TabView {
            
            NavigationView {
                VStack {
                    Text("**Age:** \(user.age)")
                }
                .navigationTitle(user.name)
            }
            .tabItem {
                Image(systemName: "person")
                Text("User")
            }
            
            NavigationView {
                List(messages) { message in
                    HStack {
                        Image(systemName: favourites.contains(message.id) ? "star.fill" : "star")
                            .foregroundColor(Color.yellow)
                        VStack(alignment: .leading) {
                            Text(message.message)
                            Text(message.from)
                                .font(.caption)
                                .bold()
                        }
                    }
                }
                .navigationTitle(user.name)
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
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
                
                user = try await userData
                messages = try await messagesData
                print("There are \(messages.count) messages.")
                favourites = try await favouritesData
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
