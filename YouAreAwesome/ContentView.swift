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
    isAwesome ? .orange : Color(red: 0.65, green: 0.1, blue: 0.1)
  }

    var body: some View {
        VStack(spacing: 20) {
          Spacer()
          Image(isAwesome ? "image0" : "image1")
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 25)
            .padding()
          Text(isAwesome ? "You Are Awesome!" : "You Are Great!")
            .font(.title)
            .fontWeight(.bold)
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
