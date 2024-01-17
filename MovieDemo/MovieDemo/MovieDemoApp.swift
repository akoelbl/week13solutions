//
//  MovieDemoApp.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 14.01.24.
//

import SwiftUI

@main
struct MovieDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(Store())
        }
    }
}
