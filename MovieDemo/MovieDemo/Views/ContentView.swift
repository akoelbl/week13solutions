//
//  ContentView.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 14.01.24.
//

import SwiftUI



struct ContentView: View {
  
  @EnvironmentObject var store: Store
  
  @MainActor @State private var showSplash = true
  
  var body: some View {
    if showSplash {
      SplashView()
        .task {
          await withTaskGroup(of: Void.self) { group in
            group.addTask {
              try? await store.fetchMovies()
            }
            group.addTask {
              try? await Task.sleep(for: .seconds(3))
            }
          }
          showSplash = false
          print(store.movies)
        }
    } else {
      TabView(selection: $store.type) {
        MainView()
        .tabItem { Text("Popular") }
        .tag(Type.popular)
        
        MainView()
        .tabItem { Text("Upcoming") }
        .tag(Type.upcoming)
      }
    }
  }
}
  
#Preview {
  ContentView()
}
