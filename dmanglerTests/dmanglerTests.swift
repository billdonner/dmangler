//
//  dmanglerTests.swift
//  dmanglerTests
//
//  Created by bill donner on 10/5/24.
//

import XCTest
@testable import dmangler
/*
 final class dmanglerTests: XCTestCase {
 
 override func setUpWithError() throws {
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }
 
 var dataManager: Dmangler!
 
 override func setUp() {
 super.setUp()
 
 // Inject initial data for testing
 let topics = ["Topic1", "Topic2", "Topic3", "Topic4"]
 let availableColors = ["Red", "Blue", "Green", "Yellow"]
 dataManager = Dmangler(topics: topics, selectedTopics: [:], availableColors: availableColors)
 }
 
 func testInitialData() {
 XCTAssertEqual(dataManager.allTopics.count, 4, "There should be 4 initial topics.")
 XCTAssertEqual(dataManager.availableColors.count, 4, "There should be 4 available colors initially.")
 }
 
 func testMarkTopicAsSelected() {
 let topic = "Topic1"
 let color = "Red"
 let success = dataManager.markTopicAsSelected(topic, withColor: color)
 
 XCTAssertTrue(success, "Color should be assigned to the topic successfully.")
 XCTAssertTrue(dataManager.isTopicSelected(topic), "Topic1 should be marked as selected.")
 XCTAssertEqual(dataManager.selectedTopics[topic], color, "Topic1 should have the assigned color Red.")
 XCTAssertFalse(dataManager.availableColors.contains(color), "Assigned color should no longer be available.")
 }
 
 func testAssignInvalidColor() {
 let topic = "Topic1"
 let invalidColor = "Purple" // Not in the initial color set
 let success = dataManager.markTopicAsSelected(topic, withColor: invalidColor)
 
 XCTAssertFalse(success, "Assigning an invalid color should fail.")
 }
 
 func testRemoveColorFromTopic() {
 let topic = "Topic1"
 let color = "Red"
 _ = dataManager.markTopicAsSelected(topic, withColor: color)
 
 let success = dataManager.deselectTopic(topic)
 XCTAssertTrue(success, "Color should be removed from the topic successfully.")
 XCTAssertFalse(dataManager.isTopicSelected(topic), "Topic1 should no longer be marked as selected.")
 XCTAssertTrue(dataManager.availableColors.contains(color), "Removed color should be available again.")
 }
 
 func testResetState() {
 _ = dataManager.markTopicAsSelected("Topic1", withColor: "Red")
 
 dataManager.reset()
 XCTAssertTrue(dataManager.selectedTopics.isEmpty, "Selected topics should be empty after reset.")
 XCTAssertEqual(dataManager.availableColors.count, 10, "All colors should be available again after reset.")
 }
 
 func testDeallocationReducesSelectedTopicsCount() {
 // Allocate some topics first
 let initialTopicCount = dataManager.selectedTopics.count
 _ = dataManager.markTopicAsSelected("Topic1", withColor: "Red")
 _ = dataManager.markTopicAsSelected("Topic2", withColor: "Blue")
 
 XCTAssertEqual(dataManager.selectedTopics.count, initialTopicCount + 2, "Selected topics count should increase after allocation.")
 
 // Deallocate one topic
 let deallocateSuccess = dataManager.deselectTopic("Topic1")
 XCTAssertTrue(deallocateSuccess, "Deallocating a topic should be successful.")
 
 // Check that the selected topics count has decreased
 XCTAssertEqual(dataManager.selectedTopics.count, initialTopicCount + 1, "Selected topics count should decrease after deallocation.")
 }
 
 func testDeallocationIncreasesAvailableColorsCount() {
 // Allocate some topics first
 let initialAvailableColorsCount = dataManager.availableColors.count
 _ = dataManager.markTopicAsSelected("Topic1", withColor: "Red")
 _ = dataManager.markTopicAsSelected("Topic2", withColor: "Blue")
 
 XCTAssertEqual(dataManager.availableColors.count, initialAvailableColorsCount - 2, "Available colors count should decrease after allocation.")
 
 // Deallocate one topic
 let deallocateSuccess = dataManager.deselectTopic("Topic1")
 XCTAssertTrue(deallocateSuccess, "Deallocating a topic should be successful.")
 
 // Check that the available colors count has increased
 XCTAssertEqual(dataManager.availableColors.count, initialAvailableColorsCount - 1, "Available colors count should increase after deallocation.")
 }
 
 func testAddThreeSelectedTopicsRemoveTwoAndCheckRemainingColor() {
 // Step 1: Add three selected topics with assigned colors
 let success1 = dataManager.markTopicAsSelected("Topic1", withColor: "Red")
 let success2 = dataManager.markTopicAsSelected("Topic2", withColor: "Blue")
 let success3 = dataManager.markTopicAsSelected("Topic3", withColor: "Green")
 
 XCTAssertTrue(success1, "Topic1 should be selected with color Red.")
 XCTAssertTrue(success2, "Topic2 should be selected with color Blue.")
 XCTAssertTrue(success3, "Topic3 should be selected with color Green.")
 
 // Capture the color of Topic3 to verify it later
 let topic3InitialColor = dataManager.selectedTopics["Topic3"]
 XCTAssertEqual(topic3InitialColor, "Green", "Topic3 should be initially assigned the color Green.")
 
 // Step 2: Remove Topic1 and Topic2
 let removeSuccess1 = dataManager.deselectTopic("Topic1")
 let removeSuccess2 = dataManager.deselectTopic("Topic2")
 
 XCTAssertTrue(removeSuccess1, "Topic1 should be deselected successfully.")
 XCTAssertTrue(removeSuccess2, "Topic2 should be deselected successfully.")
 
 // Step 3: Verify that Topic3 still exists and retains its initial color
 let remainingTopicColor = dataManager.selectedTopics["Topic3"]
 XCTAssertEqual(remainingTopicColor, topic3InitialColor, "Topic3 should retain the color it was initially assigned, which is Green.")
 
 // Step 4: Verify that Topic1 and Topic2 are no longer selected
 XCTAssertFalse(dataManager.isTopicSelected("Topic1"), "Topic1 should no longer be in selected topics.")
 XCTAssertFalse(dataManager.isTopicSelected("Topic2"), "Topic2 should no longer be in selected topics.")
 }
 }
 */
