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

let test_allTopics = ["Topic1", "Topic2", "Topic3", "Topic4", "Topic5", "Topic6", "Topic7", "Topic8", "Topic9", "Topic10","Topic11","Topic12","Topic13","Topic14","Topic15","Topic16","Topic17","Topic18","Topic19","Topic20"]
let test_allCounts = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200]
let test_scheme = 1
let test_selected:[String:MyColor] = ["Topic1":.myIceBlue]


struct ContentView: View {
  @State private var showTopicSelector = false
  @State private var gimmeCount: Int = 5  // Example gimme count
  @State private var selectedScheme = test_scheme // Default to Scheme 1
  
  @State var dmangler = Dmangler(currentScheme:   test_scheme, allCounts: test_allCounts, allTopics: test_allTopics  )
  

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
      TopicIndexView(dmangler: dmangler, selectedTopics: $dmangler.selectedTopics)
      
      Button("Select Topics") {
        showTopicSelector = true
      }
      
      Button("Add 5 gimmees") {
        gimmeCount += 5
      }
      
      Button("Wipe out Gimmees") {
        gimmeCount = 0
      }
    }
    .onChange( of: selectedScheme) { older,newer in
      
           dumpTopicsAndColors("changing scheme from \(older) to \(newer), this is the old state",from: dmangler.selectedTopics)
      
      dmangler.selectedTopics = reworkTopics(topics:  dmangler.selectedTopics,fromscheme: older,toscheme: newer)
      dmangler.currentScheme = newer
      
           dumpTopicsAndColors("after changing scheme from \(older) to \(newer), this is the new state",from: dmangler.selectedTopics)
 
    }
    .onAppear {
      let _ = dmangler.load_data(scheme:1,topics:test_allTopics,
                         counts:test_allCounts,
                         selected:test_selected )
    
      dumpTopicsAndColors("onAppear loading data",  from: dmangler.selectedTopics )
    }
    .fullScreenCover(isPresented: $showTopicSelector) {
      // Pass selected scheme to TopicSelectorView
      TopicSelectorView(dmangler: dmangler, gimmeCount: $gimmeCount)
    }
  }
}


