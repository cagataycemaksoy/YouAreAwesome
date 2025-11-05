//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Cem Aksoy on 5.11.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var isAwesome = false
  private var color: Color {
    isAwesome ? .orange : .indigo
  }

    var body: some View {
        VStack(spacing: 20) {
          Spacer()
          Image(systemName: isAwesome ? "sun.max.fill" : "hand.thumbsup")
            .resizable()
            .scaledToFit()
            .foregroundStyle(color)
          Text(isAwesome ? "You Are Awesome!" : "You Are Great!")
            .font(.title)
            .fontWeight(.light)
            .foregroundStyle(color)
          Spacer()
          Button("Press Me!") {
            withAnimation(.easeIn) {
              isAwesome.toggle()
            }
          }
          .tint(color)
          .buttonStyle(.bordered)
          .font(.title3)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
