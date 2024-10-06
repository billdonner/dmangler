//
//  dmangler.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//

import SwiftUI

func flattenDictionaryKeys<K, V>(_ dictionary: [K: V]) -> [K] {
    return Array(dictionary.keys)
}
func removeInstances<T: Equatable>(from array: [T], removing elements: [T]) -> [T] {
    return array.filter { !elements.contains($0) }
}






@Observable
class Dmangler {
  var allCounts: [Int] = []  // Count for each topic
  var allTopics: [String] = []  // All possible topics
  var availableTopics: [String] = []  // Topics currently available for selection
  
  var selectedTopics: [String: TopicColor] = [:]  // Selected topics with color
  var availableColors: [TopicColor] = TopicColor.allCases  // All available colors
  
  static let shared = Dmangler()
  
  init() {
    //  setupInitialSelectedTopics()
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
    updateAvailableTopics()
  }
  
  // Refresh available colors to avoid duplicates
  func refreshAvailableColors() {
    availableColors = TopicColor.allCases.filter { color in
      !selectedTopics.values.contains(color)
    }
  }
  
  // Update available topics to exclude selected ones
  func updateAvailableTopics() {
    availableTopics = allTopics.filter { !selectedTopics.keys.contains($0) }
  }
  
}
