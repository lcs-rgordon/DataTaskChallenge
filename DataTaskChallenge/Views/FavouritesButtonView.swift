//
//  FavouritesButtonView.swift
//  FavouritesButtonView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct FavouritesButtonView: View {
    
    var message: Message
    @Binding var favourites: Favourites
    
    var body: some View {
        
        Button(action: {
            if favourites.contains(message.id) {
                // Toggle action, remove a message from favourites if it's already there
                favourites = favourites.filter { item in
                    item != message.id }
            } else {
                // Add to favourites
                favourites.append(message.id)
            }
        }, label: {
            Image(systemName: favourites.contains(message.id) ? "star.fill" : "star")
                .foregroundColor(Color.yellow)

        })
        
    }
}

//struct FavouritesButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesButtonView()
//    }
//}
