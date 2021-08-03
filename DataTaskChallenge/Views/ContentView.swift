//
//  ContentView.swift
//  DataTaskChallenge
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var dataProvider: DataProvider
        
    var body: some View {
        TabView {
            NavigationView {
                
                VStack {
                    HeaderView()
                    GroupChatListView()
                    
                }
                .navigationTitle("Group Chat")
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
            }
            
            NavigationView {
                
                VStack {
                    HeaderView()
                    FavouritesListView()
                }
                .navigationTitle("Favourites")

            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favourites")
            }
            
        }
        .task {
            await dataProvider.fetchData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
