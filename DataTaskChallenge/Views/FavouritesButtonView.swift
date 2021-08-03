//
//  FavouritesButtonView.swift
//  FavouritesButtonView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct FavouritesButtonView: View {
    
    var message: Message
    @EnvironmentObject private var dataProvider: DataProvider
    
    var body: some View {
        
        Button(action: {
            if dataProvider.favourites.contains(message.id) {
                // Toggle action, remove a message from favourites if it's already there
                dataProvider.favourites = dataProvider.favourites.filter { item in
                    item != message.id }
            } else {
                // Add to favourites
                dataProvider.favourites.append(message.id)
            }
        }, label: {
            Image(systemName: dataProvider.favourites.contains(message.id) ? "star.fill" : "star")
                .foregroundColor(Color.yellow)

        })
        
    }
}

//struct FavouritesButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesButtonView()
//    }
//}
