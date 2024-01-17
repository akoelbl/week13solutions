//
//  MovieDetailView.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

struct MovieDetailView: View {
  
  let movie: Movie
  
  @EnvironmentObject var store: Store
  
  @State var orientation = UIDeviceOrientation.portrait
  
  @State private var showAlert = false
  @State private var note = ""
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        MovieInfos(
          movie: movie,
          columnWidth: geo.size.width - 80,
          imgWidth: geo.size.width - 80
        )
      }
      .padding(16)
      .background(Color("background"))
      .onRotate { orientation = $0 }
      
      .alert("Add a memo for \"\(movie.title)\"", isPresented: $showAlert) {
        TextField("Note", text: $note)
        Button("Cancel", role: .cancel) {}
        Button("OK") {
          print("OK")
          store.addMemo(for: movie, text: note)
        }
      }
      
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showAlert = true
          } label: {
            ToolbarButton(
              text: "Add memo",
              systemName: "plus.circle"
            )
          }
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    MovieDetailView(movie: Movie.example)
      .environmentObject(Store())
  }
}
