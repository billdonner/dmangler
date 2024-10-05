//
//  dmangler.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//

import SwiftUI


enum TopicColor: Int , CaseIterable, Comparable {
  case myred = 0
  case myblue
  case mygreen
  case myyellow
  case myorange
  case mypurple
  case myindigo
  case mycyan
  case myoffwhite
  case myoffblack
  
  // You can add more colors as needed
  
  // Implement Comparable protocol
  static func < (lhs: TopicColor, rhs: TopicColor) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}

struct ColorManager {
  // External array of colors and names
  static let colors: [(name: TopicColor, color: Color,nickname: String  )] = [
    (.myred, Color.red,"red"),
    (.myblue, Color.blue,"blue"),
    (.mygreen, Color.green,"green"),
    (.myyellow, Color.yellow,"yellow"),
    (.myorange, Color.orange,"orange"),
    (.mypurple, Color.purple,"purple"),
    (.myindigo, Color.indigo,"indigo"),
    (.mycyan, Color.cyan,"cyan"),
    (.myoffwhite, Color(red: 0.9, green: 0.9, blue: 0.9),"offwhite"),
    (.myoffblack, Color(red: 0.1, green: 0.1, blue: 0.1),"offblack")
  ]
  
  static func color(for topicColor: TopicColor) -> Color {
    return colors[topicColor.rawValue].color
  }
  static func nickname(for topicColor: TopicColor) -> String {
    return colors[topicColor.rawValue].nickname
  }
  
  // Get all available colors as enum values
  static func getAllColors() -> [TopicColor] {
    return TopicColor.allCases
  }
}

@Observable
class Dmangler  : ObservableObject {
    var allTopics: [String] = []  // All possible topics
    var availableTopics: [String] = []  // Topics currently available for selection
    var selectedTopics: [String: TopicColor] = [:]  // Selected topics with color
    var availableColors: [TopicColor] = TopicColor.allCases// Example colors
    
  
    static let shared = Dmangler()

    init() {
        setupInitialSelectedTopics()
    }
    
    // Setup initial selected topics with unique colors
    func setupInitialSelectedTopics() {
        // Example of pre-selected topics
        let initiallySelectedTopics = ["Topic1", "Topic2", "Topic3"]
        
        for topic in initiallySelectedTopics {
            if let color = availableColors.randomElement() {
                selectedTopics[topic] = color 
                availableColors.removeAll { $0 == color }  // Remove the assigned color from availableColors
            }
        }
    }

    // Method to get available topics
    func getAvailableTopics() -> [String] {
        return allTopics.filter { !selectedTopics.keys.contains($0) }
    }
    
    // Add topic to selected list and remove from available topics
    func addTopic(_ topic: String, color: TopicColor, freeCount: Int) {
        selectedTopics[topic] = color
        availableTopics.removeAll { $0 == topic }
        availableColors.removeAll { $0 == color }
        availableColors.sort()
    }
    
    // Remove topic from selected list and return to available topics
    func removeTopic(_ topic: String) {
        guard let topicData = selectedTopics.removeValue(forKey: topic) else { return }
        availableTopics.append(topic)
        availableTopics.sort()
        availableColors.append(topicData)
        availableColors.sort()
    }
}
 
//
//@Observable
//class Dmangler : ObservableObject {
//    var allTopics: [String] = []  // All possible topics
//    var availableTopics: [String] = []  // Topics currently available for selection
//    
//    var selectedTopics: [String: TopicColor] = [:]  // Selected topics with color and freeCount
//    var availableColors: [TopicColor] = [.myred, .myblue, .mygreen, .myyellow, .myorange, .mypurple]  // Example colors
//  
//  static let shared = Dmangler()
//    // Method to get available topics
//    func getAvailableTopics() -> [String] {
//        return allTopics.filter { !selectedTopics.keys.contains($0) }
//    }
//    
//    // Add topic to selected list and remove from available topics
//    func addTopic(_ topic: String, color: TopicColor, freeCount: Int) {
//        selectedTopics[topic] = color//Topic(color: color, freeCount: freeCount)
//        availableTopics.removeAll { $0 == topic }
//        availableColors.removeAll { $0 == color }
//        availableColors.sort()
//    }
//    
//    // Remove topic from selected list and return to available topics
//    func removeTopic(_ topic: String) {
//        guard let topicData = selectedTopics.removeValue(forKey: topic) else { return }
//        availableTopics.append(topic)
//        availableTopics.sort()
//        availableColors.append(topicData)
//        availableColors.sort()
//    }
//}
/*
@Observable
class Dmangler {
  internal init(topics: [String] = [], selectedTopics: [String: TopicColor] = [:], availableColors: [TopicColor] = []) {
    self.topics = topics
    self.selectedTopics = selectedTopics
    self.availableColors = availableColors
  }
  
  // Properties to manage topics and colors
  var topics: [String]
  var selectedTopics: [String: TopicColor] // Maps topic to color
  var availableColors: [TopicColor]
  
  static let shared = Dmangler()
  
  
  
  // Initialize with external data
  func  inject(topics: [String] = [], selectedTopics: [String: TopicColor] = [:], availableColors: [TopicColor] = []) {
    self.topics = topics
    self.selectedTopics = selectedTopics
    self.availableColors = availableColors
  }
  
  // MARK: - API Methods
  
  // Mark a topic as selected and assign a color
  func markTopicAsSelected(_ topic: String, withColor color: TopicColor) -> Bool {
    // Check if topic is valid and not already selected
    guard !selectedTopics.keys.contains(topic), availableColors.contains(color) else {
      return false
    }
    
    // Add the topic to the selected topics
    selectedTopics[topic] = color
    
    // Remove the color from the available pool
    availableColors.removeAll { $0 == color }
    
    return true
  }
  
  // Deselect a topic and return its color to the pool
  func deselectTopic(_ topic: String) -> Bool {
    guard let color = selectedTopics.removeValue(forKey: topic) else {
      return false // Topic was not selected
    }
    
    // Add the color back to the available pool
    availableColors.append(color)
    
    return true
  }
  
  // Check if a topic is selected
  func isTopicSelected(_ topic: String) -> Bool {
    return selectedTopics.keys.contains(topic)
  }
  
  // Get Available Topics
  func getAvailableTopics() -> [String] {
    return topics.filter { !selectedTopics.keys.contains($0) }
  }
  
  
  
  // Reset all selections and available colors
  func reset() {
    selectedTopics.removeAll()
    availableColors = ColorManager.getAllColors() // Use an external color manager or data source
  }
  
  // Save state (for future persistence logic)
  func saveState() {
    // Logic to persist selectedTopics and availableColors
  }
  
  // Load state (for future persistence logic)
  func loadState() {
    // Logic to load saved state from storage
  }
}
 
// Example Usage:
func crudeTest () {
  let topics = ["Topic1", "Topic2", "Topic3", "Topic4"]
  let availableColors:[TopicColor] = [.myred,.myblue,.mygreen,.myyellow,.myorange,.mypurple]
  let dataManager = Dmangler.shared
  dataManager.inject(topics:topics,selectedTopics:[:],availableColors: availableColors)
  
  // Select a topic
  let success = dataManager.markTopicAsSelected("Topic1", withColor: .myred)
  if success {
    print("Topic1 selected successfully.")
  } else {
    print("Failed to select Topic1.")
  }
  
  // Deselect a topic
  let removalSuccess = dataManager.deselectTopic("Topic1")
  if removalSuccess {
    print("Topic1 deselected successfully.")
  } else {
    print("Failed to deselect Topic1.")
  }
  
  // Check if a topic is selected
  if dataManager.isTopicSelected("Topic1") {
    print("Topic1 is currently selected.")
  } else {
    print("Topic1 is not selected.")
  }
}
*/
