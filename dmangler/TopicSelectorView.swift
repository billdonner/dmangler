//
//  TopicSelectorView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//


import SwiftUI

import SwiftUI

struct TopicSelectorView: View {
  @Bindable var dmangler: Dmangler
  @Binding var  gimmeCount: Int // Gimme count passed as a binding
  
  // Temporary state to handle topic selections
  
  @State private var tempGimmeeCount: Int = 0
  @State private var tempActiveColors: [MyColor] = []
  @State private var tempAvailableColors: [MyColor] = []
  @State private var tempAvailableTopics: [String] = []
  @State private var tempSelectedTopics: [String: MyColor] = [:]
  @State private var temp: Int = 0  // To restore gimme count on cancel
  

  // Alert state
  @State private var showAlert = false
  @State private var showMinimumSelectionAlert = false  // New alert state for minimum selection
  @State private var showMaximumSelectionAlert = false  // New alert state for maximum selection
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      VStack {
        // Use the modified TopicIndexView with a binding to tempSelectedTopics
        TopicIndexView(dmangler: dmangler, selectedTopics: $tempSelectedTopics,scheme:$dmangler.currentScheme)
          .frame(height: 100)
          .padding(.top, 8)
        
        // Gimme count display at the top
        Text("Gimmees: \(tempGimmeeCount)")
          .font(.caption)
          .foregroundColor(.secondary)
          .padding(.top, 8)
        
        // List of already selected topics
        List {
          Section(header: Text("Selected Topics")) {
            ForEach(tempSelectedTopics.keys.sorted(), id: \.self) { topic in
              if let color = tempSelectedTopics[topic] {
                HStack {
                  Text(topic)
                  Spacer()
                  Circle()
                    .fill(ColorManager.backgroundColor(for: color))  // Use enum to get Color
                    .frame(width: 20, height: 20)
                  Button("Remove?") {
                    removeTopic(topic)
                  }
                  .disabled(tempGimmeeCount <= 0)  // Disable if gimme count is zero or less
                }
              }
            }
          }
        }
        
        // List of available topics
        List {
          Section(header: Text("Available Topics")) {
            ForEach(tempAvailableTopics, id: \.self) { topic in
              HStack {
                Text(topic)
                Spacer()
                Button("Add?") {
                  addTopic(topic)
                }
                .disabled(tempGimmeeCount <= 0)  // Disable if gimme count is zero or less
              }
            }
          }
        }
      }
      .navigationBarItems(
        leading: Button("Cancel") {
          cancelSelection()
        },
        trailing: Button("Done") {
          finalizeSelection()//save changes
          presentationMode.wrappedValue.dismiss()
        }
      )
      .navigationTitle("Select Topics")
      .onAppear {
        setupView()
      }
      .alert(isPresented: $showAlert) {
        Alert(title: Text("No Gimmees"), message: Text("You have no gimmees left to add or remove topics."), dismissButton: .default(Text("OK")))
      }
      .alert(isPresented: $showMinimumSelectionAlert) {
        Alert(title: Text("Selection Required"), message: Text("Please select at least 3 topics."), dismissButton: .default(Text("OK")))
      }
      .alert(isPresented: $showMaximumSelectionAlert) {
        Alert(title: Text("Maximum Reached"), message: Text("You cannot select more than 10 topics."), dismissButton: .default(Text("OK")))
      }
    }
  }
  
  // MARK: - Action Methods
  
  private func addTopic(_ topic: String) {
    if tempSelectedTopics.count >= 10 {
      showMaximumSelectionAlert = true
    } else {
      
      if let color = tempAvailableColors.randomElement() {
       // print("Add topic \(topic) with color \(color)")
        tempSelectedTopics[topic] = color
        tempActiveColors.append(color)
        tempAvailableTopics.removeAll(where: { $0 == topic } )
        tempAvailableColors.removeAll(where: { $0 == color } )
        tempGimmeeCount -= 1
      }
    }
  }
  
  private func removeTopic(_ topic: String) {
    let color = tempSelectedTopics[topic] ?? MyColor.myOffBlack
   // print("Remove topic \(topic) with color \(color)")
    tempSelectedTopics.removeValue(forKey: topic)
    tempAvailableTopics.append(topic)
    tempAvailableColors.append(color)
    tempActiveColors.removeAll(where: { $0 == color } )
    tempGimmeeCount -= 1
  }
  
  private func cancelSelection() {  // Restore the initial gimme count
    presentationMode.wrappedValue.dismiss()  // Dismiss without saving changes
  }
  
  private func finalizeSelection() {
    if tempSelectedTopics.count < 3 {
      showMinimumSelectionAlert = true
    } else {
      
      gimmeCount = tempGimmeeCount
      dmangler.selectedTopics = tempSelectedTopics  // Persist the changes
      dmangler.activeColors = flattenDictionaryValues(dmangler.selectedTopics)
      dmangler.availableColors =  removeInstances(from:MyColor.allCases, removing:dmangler.activeColors)
      dmangler.availableTopics = tempAvailableTopics
      presentationMode.wrappedValue.dismiss()  // Dismiss and save changes
    }
  }
  
  private func setupView() {
    tempGimmeeCount = gimmeCount  // Store the initial gimme count
    tempActiveColors = dmangler.activeColors
    tempAvailableColors = dmangler.availableColors
    tempAvailableTopics = dmangler.availableTopics
    tempSelectedTopics = dmangler.selectedTopics  // Load the selected topics
    if tempGimmeeCount <= 0 {
      showAlert = true
    }
  }
}
struct TopicSelectorView_Previews: PreviewProvider {
  @State static private var gimmeCount: Int = 5  // Example gimme count
  
  static var previews: some View {
    let dmangler = load_Dmangler(Dmangler.shared)
    
    
    return TopicSelectorView(dmangler: dmangler, gimmeCount: $gimmeCount)
      .previewLayout(.device)
      .previewDisplayName("Topic Selector View")
      .environment(\.colorScheme, .light)  // You can also test dark mode by setting .dark
  }
}
