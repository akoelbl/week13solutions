//
//  Movie.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 14.01.24.
//

import Foundation

struct Movie: Decodable, Identifiable {
  let id: Int
  let title: String
  let poster_path: String
  let vote_average: Double
  let vote_count: Int
  let overview: String
  let release_date: String
  
  var avgString: String {
    String(format: "Average vote: %.2f", vote_average)
  }
  
  static let example = Movie(
    id: 753342,
    title: "Napoleon",
    poster_path: "/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg",
    vote_average: 6.5,
    vote_count: 1159,
    overview: "An epic that details the checkered rise and fall of French Emperor Napoleon Bonaparte and his relentless journey to power through the prism of his addictive, volatile relationship with his wife, Josephine.",
    release_date: "2023-11-22"
  )
}

struct ApiResponse: Decodable {
  let results: [Movie]
}
