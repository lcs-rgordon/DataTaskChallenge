//
//  DataTaskChallengeApp.swift
//  DataTaskChallenge
//
//  Created by Russell Gordon on 2021-08-02.
//

import SwiftUI

@main
struct DataTaskChallengeApp: App {
    
    @StateObject private var dataProvider = DataProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataProvider)
        }
    }
}
