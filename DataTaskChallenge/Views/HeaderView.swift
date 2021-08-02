//
//  HeaderView.swift
//  HeaderView
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

struct HeaderView: View {
    
    var name: String
    var age: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.largeTitle)
                    .bold()
                Text("**Age:** \(age)")
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct Headerview_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(name: "Patrick Stewart", age: 81)
    }
}
