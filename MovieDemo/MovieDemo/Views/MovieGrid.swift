//
//  MovieGrid.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 15.01.24.
//

import SwiftUI

struct MovieGrid: View {
  
  static let columnWidth = 160.0
  
  @EnvironmentObject var store: Store
  
  let column = GridItem(.adaptive(minimum: MovieGrid.columnWidth))
  
  var body: some View {
    if store.movies.isEmpty { // should not occur
      ContentUnavailableView.init("No movies found", systemImage: "bookmark")
    } else {
      ScrollView {
        LazyVGrid(columns: [column], spacing: 24) {
          ForEach(store.movies) { movie in
            VStack(spacing: 12) {
              MovieImage(movie: movie, columnWidth: MovieGrid.columnWidth)
              MovieLink(movie: movie)
            }
          }
        }
      }
      .padding()
    }
  }
}
