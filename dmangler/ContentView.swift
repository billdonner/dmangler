//
//  ContentView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//        .onAppear {
//          crudeTest()
//        }
//    }
//}

#Preview {
    ContentView()
}
struct ContentView: View {
    @State private var showTopicSelector = false
    @State private var gimmeCount: Int = 5  // Example gimme count
  
  let dmangler = Dmangler.shared

    var body: some View {
      VStack(spacing:50) {
        // Display the current gimme count
        Text("Gimmees Available: \(gimmeCount)")
            .font(.headline)
            .padding()
        
        TopicIndexView(selectedTopics: dmangler.selectedTopics)
      
            Button("Select Topics") {
                showTopicSelector = true
            }
          Button("Add 5 gimmees") {
       gimmeCount += 5// true
          }
        }
      .onAppear {
        dmangler.allTopics = ["Topic1", "Topic2", "Topic3", "Topic4", "Topic5", "Topic6", "Topic7", "Topic8", "Topic9", "Topic10","Topic11","Topic12","Topic13","Topic14","Topic15","Topic16","Topic17","Topic18","Topic19","Topic20"]
        dmangler.selectedTopics = ["Topic1": .myred, "Topic2": .myblue]  // Mapping topics to TopicColor enum
        dmangler.availableColors = TopicColor.allCases
      }
        .fullScreenCover(isPresented: $showTopicSelector) {
            TopicSelectorView(dmangler: dmangler, gimmeCount: $gimmeCount)
        }
    }
}
