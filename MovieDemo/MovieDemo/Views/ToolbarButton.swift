//
//  ToolbarButton.swift
//  MovieDemo
//
//  Created by Anton Kölbl on 16.01.24.
//

import SwiftUI

struct ToolbarButton: View {
  let text: String
  let systemName: String
  
  var body: some View {
    HStack {
      Text(text)
        .font(.footnote)
      Image(systemName: systemName)
    }
  }
}

#Preview {
  ToolbarButton(text: "Add", systemName: "plus")
}
