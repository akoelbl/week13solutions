//
//  MovieInfos.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

struct MovieInfos: View {
  
  let movie: Movie
  let columnWidth: Double
  let imgWidth: Double
  
  var body: some View {
    VStack(spacing: 16) {
      MovieImage(movie: movie, columnWidth: columnWidth)
      Text(movie.title)
        .font(.headline)
      Text(movie.overview)
      
      Rectangle()
        .frame(width: imgWidth, height: 1)
      
      Text("Voters: \(movie.vote_count)")
      Text(movie.avgString)
      Rectangle()
        .fill(.gray)
        .frame(width: imgWidth, height: 16)
        .overlay {
          Rectangle()
            .fill(.blue)
            .offset(x: -imgWidth * (10 - movie.vote_average) / 20)
            .frame(
              width: imgWidth * movie.vote_average / 10,
              height: 16
            )
        }
      Rectangle()
        .frame(width: imgWidth, height: 1)
      Text("Release Date: \(movie.release_date)")
        .font(.footnote)
    }
  }
}

#Preview {
  MovieInfos(movie: Movie.example, columnWidth: 200.0, imgWidth: 200.0)
}
