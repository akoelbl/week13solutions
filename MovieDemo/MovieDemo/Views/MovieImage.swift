//
//  MovieImage.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

struct MovieImage: View {
  
  let movie: Movie
  let columnWidth: Double
  
  var body: some View {
    AsyncImage(url: Store.getPosterURL(for: movie)) { image in
      image
        .resizable()
        .frame(
          width: columnWidth,
          height: columnWidth * 3 / 2
        )
        .aspectRatio(contentMode: .fill)
    } placeholder: {
      Color.gray
        .frame(
          width: columnWidth,
          height: columnWidth * 3 / 2
        )
    }
  }
}

#Preview {
  MovieImage(movie: Movie.example, columnWidth: 320.0)
}
