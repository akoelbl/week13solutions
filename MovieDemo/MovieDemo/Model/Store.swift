//
//  Store.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 14.01.24.
//

import Foundation

enum MovieAppError: String, Error {
  case invalidURL = "URL is invalid"
  case noData = "No suitable data coming back."
  case invalidResponse = "Response is invalid"
}

enum Type: String {
  case popular = "Popular"
  case upcoming = "Upcoming"
}

class Store: ObservableObject {
  
  static let apiKey = "5d03645aac4c476d41ab1227e69d1c67"
  static let baseAddress = "https://api.themoviedb.org/3/"
  static let popularMoviesAddress = baseAddress + "movie/popular?api_key=\(apiKey)"
  static let upcomingMoviesAddress = baseAddress + "movie/upcoming?api_key=\(apiKey)"
  
  @Published var popularMovies: [Movie] = []
  @Published var upcomingMovies: [Movie] = []
  @Published var type = Type.popular
  
  var memos: [String: String] = [:]
  
  var memoKeys: [String] {
    Array(memos.keys.sorted(by: <))
  }
  
  func addMemo(for movie: Movie, text: String) {
    let key = movie.title
    if !text.isEmpty {
      if let value = memos[key] {
        memos[key] = "\(text)\n\(value)"
      } else {
        memos[movie.title] = text
      }
    }
  }
  
  func getValue(for key: String) -> String {
    memos[key] ?? "---"
  }
  
  var movies: [Movie] {
    type == .popular ? popularMovies : upcomingMovies
  }
  
  static func getPosterURL(for movie: Movie) -> URL? {
    let posterPath = movie.poster_path
    let posterURLString = "https://image.tmdb.org/t/p/original\(posterPath)"
    return URL(string: posterURLString)
  }
  
  func fetchMovies() async throws {
    let addressString = type == .popular ? Store.popularMoviesAddress : Store.upcomingMoviesAddress
    guard let url = URL(string: addressString) else {
      throw MovieAppError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
      throw MovieAppError.invalidResponse
    }
    
    let json = String(data: data, encoding: .utf8)
    //print(json ?? "No json")
    let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
    await MainActor.run {
      if type == .popular {
        popularMovies = apiResponse.results
        //print(popularMovies.first!)
      } else {
        upcomingMovies = apiResponse.results
      }
    }
  }
  
}
