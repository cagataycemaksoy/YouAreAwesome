//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Cem Aksoy on 5.11.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var imageNum = Int.random(in: 0...9)
  @State private var textNum = Int.random(in: 0...5)
  private let phrases = ["You Are Great!", "Great Energy!", "You Are Awesome!", "Such a kind person.", "You Are Fantastic!", "Fabulous! That is you."]
  
    var body: some View {
        VStack(spacing: 20) {
          Spacer()
          VStack {
            Image("image\(imageNum)")
              .resizable()
              .scaledToFit()
              .clipShape(RoundedRectangle(cornerRadius: 25))
              .shadow(radius: 25)
              .padding()
            Text(phrases[textNum])
              .font(.title)
              .fontWeight(.bold)
          }
            
          Spacer()
          Spacer()
          Button("Press Me!") {
            withAnimation(.easeIn) {
              buttonPressed()
            }
          }
          .tint(.black)
          .buttonStyle(.bordered)
          .font(.title3)
          .fontWeight(.semibold)
        }
        .padding()
    }
  
  private func buttonPressed() {
    let oldImage = imageNum
    let oldText = textNum
    
    repeat {
      imageNum = Int.random(in: 0...9)
    } while (imageNum == oldImage)
    
    repeat {
      textNum = Int.random(in: 0...5)
    } while (textNum == oldText)
  }
  
}

#Preview {
    ContentView()
}
