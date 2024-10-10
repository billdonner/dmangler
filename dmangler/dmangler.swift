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
func flattenDictionaryValues<K, V>(_ dictionary: [K: V]) -> [V] {
    return Array(dictionary.values)
}
func removeInstances<T: Equatable>(from array: [T], removing elements: [T]) -> [T] {
    return array.filter { !elements.contains($0) }
}






@Observable
class Dmangler  {
  internal init(allCounts: [Int] = [], allTopics: [String] = [], availableTopics: [String] = [], selectedTopics: [String : MyColor] = [:], activeColors: [MyColor] = [], availableColors: [MyColor] = []) {
    self.allCounts = allCounts
    self.allTopics = allTopics
    self.availableTopics = availableTopics
    self.selectedTopics = selectedTopics
    self.activeColors = activeColors
    self.availableColors = availableColors
  }
  
  var allCounts: [Int] = []  // Count for each topic
  var allTopics: [String] = []  // All possible topics
  var availableTopics: [String] = []  // Topics currently available for selection
  
  var selectedTopics: [String: MyColor] = [:]  // Selected topics with color
  var activeColors: [MyColor] = []  
  var availableColors: [MyColor] = []//TopicColor.allCases  // All available colors
  
  var currentScheme :Int = 1
  
  static let shared = Dmangler()
  
  func setScheme(_ scheme: Int) {
    currentScheme = scheme  
  }
//  // Setup initial selected topics with unique colors
//  func setupInitialSelectedTopics() {
//    // Example of pre-selected topics
//    let initiallySelectedTopics = ["Topic1", "Topic2", "Topic3"]
//    
//    for topic in initiallySelectedTopics {
//      if let color = availableColors.randomElement() {
//        selectedTopics[topic] = color
//        availableColors.removeAll { $0 == color }  // Remove the assigned color from availableColors
//      }
//    }
//    updateAvailableTopics()
//  }
//  func setAvailableColors(_ colors: [MyColor]) {
//    availableColors = colors
//  }

//  // Refresh available colors to avoid duplicates
//  func refreshAvailableColors() {
//    availableColors = MyColor.allCases.filter { color in
//      !selectedTopics.values.contains(color)
//    }
//  }
  
  // Update available topics to exclude selected ones
//  func updateAvailableTopics() {
//    availableTopics = allTopics.filter { !selectedTopics.keys.contains($0) }
//  }
//  
}
