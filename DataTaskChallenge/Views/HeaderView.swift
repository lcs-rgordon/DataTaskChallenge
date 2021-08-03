//
//  HeaderView.swift
//  HeaderView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject private var dataProvider: DataProvider

    var body: some View {
        HStack {
            Image("Paul-Hudson")
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFill()
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(dataProvider.user.name)
                    .font(.subheadline)
                Text("Age: \(dataProvider.user.age)")
                    .font(.caption)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

//struct Headerview_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView(name: "Patrick Stewart", age: 81)
//    }
//}
