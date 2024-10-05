//
//  TopicSelectorView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//


import SwiftUI

struct TopicSelectorView: View {
    @ObservedObject var dmangler: Dmangler
    
    // Temporary state to handle topic selections
    @State private var tempSelectedTopics: [String: TopicColor] = [:]
  @State private var  tempAvailableTopics: [String] = []  // Topics currently available for selection
  @State private var  tempAvailableColors: [TopicColor] = []  // Topics currently available for selection
  
  
  
  @State private  var selectedTopics: [String: TopicColor] = [:]  // Selected topics with color
    
    // Gimme count passed as a binding
    @Binding var gimmeCount: Int
    
    // Alert state
    @State private var showAlert = false
    @State private var showMinimumSelectionAlert = false  // New alert state for minimum selection
    @State private var showMaximumSelectionAlert = false  // New alert state for maximum selection
    @State private var tempgimmeecount = 0
  
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                // Use the modified TopicIndexView with a binding to tempSelectedTopics
                TopicIndexView(selectedTopics: tempSelectedTopics)
                    .frame(height: 100)
                    .padding(.top, 8)
                
                // Gimme count display at the top
                Text("Gimmees: \(gimmeCount)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 8)
                
                // List of already selected topics
                List {
                    Section(header: Text("Selected Topics")) {
                        ForEach(tempSelectedTopics.keys.sorted(), id: \.self) { topic in
                            if let colorEnum = tempSelectedTopics[topic] {
                                HStack {
                                    Text(topic)
                                    Spacer()
                                    Circle()
                                        .fill(ColorManager.color(for: colorEnum))  // Use enum to get Color
                                        .frame(width: 20, height: 20)
                                    Button("Remove?") {
                                        // Remove the topic and move it back to available topics
                                        if let removedColor = tempSelectedTopics.removeValue(forKey: topic) {
                                            // Add the color back to the available pool
                                            tempAvailableColors.append(removedColor)
                                            tempAvailableColors.sort()  // Sort the available colors
                                        }
                                      
                                        if !tempAvailableTopics.contains(topic) {
                                          tempAvailableTopics.append(topic)  // Return the topic to available list
                                            dmangler.availableTopics.sort()  // Sort the available topics
                                        }
                                      tempgimmeecount -= 1  // Decrease gimme count when a topic is removed
                                        checkGimmeCount() // Check gimme count and trigger alert if needed
                                    }
                                    .disabled(gimmeCount <= 0) // Disable if gimme count is zero or less
                                }
                            }
                        }
                    }
                }
                
                // List of available topics
                List {
                    Section(header: Text("Available Topics")) {
                        ForEach(dmangler.getAvailableTopics().sorted(), id: \.self) { topic in
                            HStack {
                                Text(topic)
                                Spacer()
                                Button("Add?") {
                                    // Check if the selected topics exceed 10
                                    if tempSelectedTopics.count >= 10 {
                                        showMaximumSelectionAlert = true
                                    } else if let color = dmangler.availableColors.randomElement() {
                                        // Move topic to selected and remove from available list
                                        tempSelectedTopics[topic] = color
                                      tempAvailableTopics
                                        dmangler.availableColors.removeAll { $0 == color }
                                        dmangler.availableColors.sort()  // Sort available colors after removal
                                        dmangler.availableTopics.removeAll { $0 == topic }
                                        dmangler.availableTopics.sort()  // Sort available topics after removal
                                      tempgimmeecount -= 1  // Decrease gimme count when a topic is added
                                        checkGimmeCount() // Check gimme count and trigger alert if needed
                                    }
                                }
                                .disabled(gimmeCount <= 0) // Disable if gimme count is zero or less
                            }
                        }
                    }
                }
            }
            .navigationBarItems(
                leading: Button("Cancel") {
                    // Discard changes and dismiss the view
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Done") {
                    if tempSelectedTopics.count < 3 {
                        // Show alert if less than 3 topics selected
                        showMinimumSelectionAlert = true
                    } else {
                        // Persist changes to dmangler and dismiss the view
                        dmangler.selectedTopics = tempSelectedTopics
                        dmangler.allTopics.sort()  // Sort the final selected topics
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
            .navigationTitle("Select Topics")
            .onAppear {
                // Restore previous selected topics
                tempSelectedTopics = dmangler.selectedTopics
                tempgimmeecount = gimmeCount
                
                // Show alert if gimme count is 0
                checkGimmeCount()
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
    
    // Check gimme count and show alert if it's zero or less
    private func checkGimmeCount() {
        if tempgimmeecount <= 0 {
            showAlert = true
        }
    }
}

struct TopicSelectorView_Previews: PreviewProvider {
    @State static private var gimmeCount: Int = 5  // Example gimme count
    
    static var previews: some View {
        let dmangler = Dmangler()
        // Example available topics and colors
      dmangler.allTopics = ["Topic1", "Topic2 is very very long", "Topic3", "Topic4", "Topic5", "Topic6", "Topic7", "Topic8", "Topic9", "Topic10","Topic11","Topic12","Topic13","Topic14","Topic15","Topic16","Topic17","Topic18","Topic19","Topic20"]
      dmangler.selectedTopics = ["Topic1": .myred, "Topic2 is very very long": .myblue]  // Mapping topics to TopicColor enum
      dmangler.availableColors = TopicColor.allCases
        
        return TopicSelectorView(dmangler: dmangler, gimmeCount: $gimmeCount)
            .previewLayout(.device)
            .previewDisplayName("Topic Selector View")
            .environment(\.colorScheme, .light)  // You can also test dark mode by setting .dark
    }
}
