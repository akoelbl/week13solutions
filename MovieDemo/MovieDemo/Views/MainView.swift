//
//  MainView.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

enum ViewState {
  case loading
  case inError(error: Error)
  case success
}

struct MainView: View {
  
  @State private var viewState = ViewState.loading
  @State private var showSheet = false
  
  @EnvironmentObject var store: Store
  
  var body: some View {
    NavigationStack {
      VStack {
        switch viewState {
        case .loading:
          HStack(spacing: 20) {
            ProgressView()
            Text("loading ...")
          }
          .padding(40)
        case .inError(let error):
          Text(error.localizedDescription)
            .padding(40)
        case .success:
          MovieGrid()
        }
      }
      .background(Color("background"))
      .navigationTitle("\(store.type.rawValue) Movies")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showSheet = true
          } label: {
            ToolbarButton(
              text: "View memos",
              systemName: "list.bullet.circle"
            )
          }
        }
      }
      .sheet(isPresented: $showSheet) {
        MemosSheet(showSheet: $showSheet)
        .padding(40)
      }
      .task {
        guard store.movies.isEmpty else {
          viewState = .success
          return
        }
        do {
          //try await Task.sleep(for: .seconds(1))
          try await store.fetchMovies()
          viewState = .success
        } catch {
          viewState = .inError(error: error)
        }
      }
    }
  }
}

#Preview {
  MainView()
    .environmentObject(Store())
}
