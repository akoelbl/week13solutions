//
//  SplashView.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 17.01.24.
//

import SwiftUI

struct SplashView: View {
  
  @State private var scale = 1.0
  @State private var opacity = 1.0
  
  var body: some View {
    Text("This product uses the TMDB API but is not endorsed or certified by TMDB.")
      .padding(.horizontal, 120)
      .scaleEffect(scale)
      .opacity(opacity)
      .onAppear {
        withAnimation(.easeIn(duration: 3)) {
          scale = 3.0
          opacity = 0.0
        }
      }
  }
}

#Preview {
  SplashView()
}
