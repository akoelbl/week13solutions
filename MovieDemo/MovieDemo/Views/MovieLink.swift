//
//  MovieLink.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

struct MovieLink: View {
  let movie: Movie
  
  @EnvironmentObject var store: Store
  
  var body: some View {
    NavigationLink {
      MovieDetailView(movie: movie)
    } label: {
      HStack(alignment: .center, spacing: 4) {
        Text(movie.title)
          .font(.caption)
          .foregroundColor(.primary)
          .padding(.horizontal)
        Image(systemName: "chevron.right")
      }
      .frame(height: 40)
    }
  }
}

#Preview {
  MovieLink(movie: Movie.example)
}
