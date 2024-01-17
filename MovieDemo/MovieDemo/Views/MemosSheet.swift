//
//  MemosSheet.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

struct MemosSheet: View {
  
  @Binding var showSheet: Bool
  
  @EnvironmentObject var store: Store
  
  var body: some View {
    VStack {
      if store.memos.isEmpty {
        ContentUnavailableView(
          "No memos yet",
          systemImage: "bookmark",
          description: Text("You can create memos on the detail page for any movie.")
        )
      } else {
        VStack(alignment: .center, spacing: 8) {
          Text("All memos")
            .font(.title)
            .padding(20)
          ScrollView {
            ForEach(store.memoKeys, id: \.self) { key in
              Text(key)
                .font(.caption)
                .bold()
                .padding(.top, 12)
              Text(store.getValue(for: key))
            }
          }
        }
      }
      
      Button("Close") {
        showSheet = false
      }
      .padding(.top, 40)
    }
    .padding()
    .frame(minWidth: 300)
    .background(Color("background"))
    .presentationBackground(.clear)
  }
}

#Preview {
  MemosSheet(showSheet: .constant(true))
    .environmentObject(Store())
}
