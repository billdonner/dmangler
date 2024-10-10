//
//  ContentView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//

import SwiftUI

#Preview {
  ContentView()
}

func load_Dmangler(_ dmangler: Dmangler) -> Dmangler {
  dmangler.setScheme(1)
  dmangler.allTopics = ["Topic1", "Topic2", "Topic3", "Topic4", "Topic5", "Topic6", "Topic7", "Topic8", "Topic9", "Topic10","Topic11","Topic12","Topic13","Topic14","Topic15","Topic16","Topic17","Topic18","Topic19","Topic20"]
  dmangler.allCounts = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200]
  dmangler.selectedTopics = ["Topic1":.myPine] // Mapping topics to TopicColor enum
  dmangler.availableTopics = removeInstances(from: dmangler.allTopics, removing: flattenDictionaryKeys(dmangler.selectedTopics))
  dmangler.activeColors = flattenDictionaryValues(dmangler.selectedTopics)
  dmangler.availableColors =  removeInstances(from:MyColor.allCases, removing:dmangler.activeColors)
  return dmangler
}

struct ContentView: View {
  @State private var showTopicSelector = false
  @State private var gimmeCount: Int = 5  // Example gimme count
  @State private var selectedScheme = 1  // Default to Scheme 1
  
  @State var dmangler = Dmangler.shared
  
  // Schemes
  let colorSchemes: [[MyColor]] = [
    scheme0Colors, scheme1Colors, scheme2Colors, scheme3Colors, scheme4Colors
  ]
  
  var body: some View {
    VStack(spacing: 50) {
      // Inline picker to select a scheme
      Picker("Select Scheme", selection: $selectedScheme) {
        Text("Bleak").tag(0)
        Text("Winter").tag(1)
        Text("Spring").tag(2)
        Text("Summer").tag(3)
        Text("Autumn").tag(4)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding()
      
      // Display the current gimme count
      Text("Gimmees Available: \(gimmeCount)")
        .font(.headline)
        .padding()
      
      // Pass selected scheme to TopicIndexView
      TopicIndexView(dmangler: dmangler, selectedTopics: $dmangler.selectedTopics,scheme: $dmangler.currentScheme)
      
      Button("Select Topics") {
        showTopicSelector = true
      }
      
      Button("Add 5 gimmees") {
        gimmeCount += 5
      }
    }
    .onChange( of: selectedScheme) { older,newer in
      dmangler.selectedTopics = reworkTopics(topics: dmangler.selectedTopics,fromscheme: older,toscheme: newer)
      // change schemes, change the active colors
      let activeColorCount = dmangler.activeColors.count
       dmangler.setScheme(newer)
      dmangler.availableColors = Array(allColorsForScheme(newer).dropFirst(activeColorCount))
      dmangler.activeColors = Array(allColorsForScheme(newer).prefix(activeColorCount))//(activeColorCount) ?? [])
    // print("changed to scheme \(newer) active colors are \(dmangler.activeColors)")
      //dmangler.refreshAvailableColors()
    }
    .onAppear {
      let _ = load_Dmangler(dmangler)
    }
    .fullScreenCover(isPresented: $showTopicSelector) {
      // Pass selected scheme to TopicSelectorView
      TopicSelectorView(dmangler: dmangler, gimmeCount: $gimmeCount)
    }
  }
}

