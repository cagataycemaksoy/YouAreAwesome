//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Cem Aksoy on 5.11.2025.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
  @State private var audioPlayer: AVAudioPlayer!
  
  @State private var audioNum = Int.random(in: 0...5)
  @State private var imageNum = Int.random(in: 0...9)
  @State private var textNum = Int.random(in: 0...5)
  @State private var soundOn = false
  
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
          
          HStack {
            
            Toggle("Sound On: ", isOn: $soundOn)
              .fixedSize(horizontal: true, vertical: false)
              .onChange(of: soundOn) {
                if (audioPlayer != nil && audioPlayer.isPlaying) {
                  audioPlayer.stop()
                }
              }
              
            Spacer()
            Button("Next!") {
              withAnimation(.easeIn) {
                buttonPressed()
              }
            }
            .tint(.black)
            .buttonStyle(.bordered)
            .font(.title3)
            .fontWeight(.semibold)
          }
          .padding(.horizontal)
        }
        .padding()
    }
  
  private func buttonPressed() {
    imageNum = nonRepeatingRndm(oldVal: imageNum, count: 10)
    textNum = nonRepeatingRndm(oldVal: textNum, count: 6)
    audioNum = nonRepeatingRndm(oldVal: audioNum, count: 6)
    if soundOn {
      playAudio(file: audioNum)
    }
  }
  
  func nonRepeatingRndm(oldVal: Int, count: Int) -> Int {
    var newVal: Int
    repeat {
      newVal = Int.random(in: 0..<count)
    } while (newVal == oldVal)
    return newVal
  }
  
  func playAudio(file: Int) {
    if audioPlayer != nil && audioPlayer.isPlaying {
      audioPlayer.stop()
    }
    
    guard let soundData = NSDataAsset(name: "sound\(file)") else {
      print("Failed to read the file.")
      return
    }
    
    do {
      audioPlayer = try AVAudioPlayer(data: soundData.data)
      audioPlayer.play()
    } catch {
      print("Error while creating the audio file.")
    }
  }
  
}

#Preview {
    ContentView()
}
