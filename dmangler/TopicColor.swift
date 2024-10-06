//
//  TopicColor.swift
//  dmangler
//
//  Created by bill donner on 10/6/24.
//
 
// Combined Swift Code: ColorManager with Background and Foreground Colors

import SwiftUI

enum TopicColor: String, CaseIterable, Comparable,Codable {
    // Enum cases synthesized from color names
    case myLightYellow
    case myDeepPink
    case myLightBlue
    case myRoyalBlue
    case myPeach
    case myOrange
    case myLavender
    case myMint
    case myLightCoral
    case myAqua
    case myLemon
    case mySkyBlue
    case mySunshineYellow
    case myOceanBlue
    case mySeafoam
    case myPalmGreen
    case myCoral
    case myLagoon
    case myShell
    case mySienna
    case myCoconut
    case myPineapple
    case myBurntOrange
    case myGoldenYellow
    case myCrimsonRed
    case myPumpkin
    case myChestnut
    case myHarvestGold
    case myAmber
    case myMaroon
    case myRusset
    case myMossGreen
    case myIceBlue
    case myMidnightBlue
    case myFrost
    case mySlate
    case mySilver
    case myPine
    case myBerry
    case myEvergreen
    case myStorm
    case myHolly
    case myBlack
  
  case myOffWhite
  case myOffBlack
    // Foreground enum cases
    case myGold
    case myHotPink
    case myDarkOrange
    case myDarkViolet
    case myDarkGreen
    case myCrimson
    case myTeal
    case myNavy
    case myGoldenrod
    case myForestGreen
    case myDeepTeal
    case myChocolate
    case myBrown
    case myDarkGoldenrod
    case myDarkRed
    case myOrangeRed
    case mySaddleBrown
    case myDarkOliveGreen
    case myDarkBlue
    case myAliceBlue
    case mySteelBlue
    case myDarkSlateGray
    case myDarkGray
    case myWhite

    static func < (lhs: TopicColor, rhs: TopicColor) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct ColorManager {
    // Static array for background colors
    static let backgroundColors: [(topic: TopicColor, color: Color, name: String)] = [
        (.myLightYellow, Color(red: 255/255, green: 223/255, blue: 0/255), "Light Yellow"),
        (.myDeepPink, Color(red: 255/255, green: 20/255, blue: 147/255), "Deep Pink"),
        (.myLightBlue, Color(red: 65/255, green: 105/255, blue: 225/255), "Light Blue"),
        (.myPeach, Color(red: 255/255, green: 140/255, blue: 0/255), "Peach"),
        (.myLavender, Color(red: 148/255, green: 0/255, blue: 211/255), "Lavender"),
        (.myMint, Color(red: 0/255, green: 100/255, blue: 0/255), "Mint"),
        (.myLightCoral, Color(red: 220/255, green: 20/255, blue: 60/255), "Light Coral"),
        (.myAqua, Color(red: 0/255, green: 128/255, blue: 128/255), "Aqua"),
        (.myLemon, Color(red: 255/255, green: 140/255, blue: 0/255), "Lemon"),
        (.mySkyBlue, Color(red: 135/255, green: 206/255, blue: 235/255), "Sky Blue"),
        (.mySunshineYellow, Color(red: 255/255, green: 255/255, blue: 0/255), "Sunshine Yellow"),
        (.myOceanBlue, Color(red: 0/255, green: 105/255, blue: 148/255), "Ocean Blue"),
        (.mySeafoam, Color(red: 70/255, green: 240/255, blue: 220/255), "Seafoam"),
        (.myPalmGreen, Color(red: 34/255, green: 139/255, blue: 34/255), "Palm Green"),
        (.myCoral, Color(red: 255/255, green: 127/255, blue: 80/255), "Coral"),
        (.myLagoon, Color(red: 72/255, green: 209/255, blue: 204/255), "Lagoon"),
        (.myShell, Color(red: 210/255, green: 105/255, blue: 30/255), "Shell"),
        (.myCoconut, Color(red: 139/255, green: 69/255, blue: 19/255), "Coconut"),
        (.myPineapple, Color(red: 255/255, green: 223/255, blue: 0/255), "Pineapple"),
        (.myBurntOrange, Color(red: 204/255, green: 85/255, blue: 0/255), "Burnt Orange"),
        (.myGoldenYellow, Color(red: 255/255, green: 223/255, blue: 0/255), "Golden Yellow"),
        (.myCrimsonRed, Color(red: 139/255, green: 0/255, blue: 0/255), "Crimson Red"),
        (.myPumpkin, Color(red: 255/255, green: 117/255, blue: 24/255), "Pumpkin"),
        (.myChestnut, Color(red: 149/255, green: 69/255, blue: 53/255), "Chestnut"),
        (.myHarvestGold, Color(red: 218/255, green: 165/255, blue: 32/255), "Harvest Gold"),
        (.myAmber, Color(red: 255/255, green: 191/255, blue: 0/255), "Amber"),
        (.myMaroon, Color(red: 139/255, green: 0/255, blue: 0/255), "Maroon"),
        (.myRusset, Color(red: 165/255, green: 42/255, blue: 42/255), "Russet"),
        (.myMossGreen, Color(red: 85/255, green: 107/255, blue: 47/255), "Moss Green"),
        (.myIceBlue, Color(red: 176/255, green: 224/255, blue: 230/255), "Ice Blue"),
        (.myMidnightBlue, Color(red: 25/255, green: 25/255, blue: 112/255), "Midnight Blue"),
        (.myFrost, Color(red: 70/255, green: 130/255, blue: 180/255), "Frost"),
        (.mySlate, Color(red: 47/255, green: 79/255, blue: 79/255), "Slate"),
        (.mySilver, Color(red: 169/255, green: 169/255, blue: 169/255), "Silver"),
        (.myPine, Color(red: 0/255, green: 100/255, blue: 0/255), "Pine"),
        (.myBerry, Color(red: 139/255, green: 0/255, blue: 0/255), "Berry"),
        (.myEvergreen, Color(red: 0/255, green: 100/255, blue: 0/255), "Evergreen"),
        (.myStorm, Color(red: 119/255, green: 136/255, blue: 153/255), "Storm"),
        (.myHolly, Color(red: 0/255, green: 128/255, blue: 0/255), "Holly"),
        (.myBlack, Color(red: 0/255, green: 0/255, blue: 0/255), "Black"),
        (.myOffBlack, Color(red: 0.1, green: 0.1, blue: 0.1),"Off Black"),
        (.myOffWhite, Color(red: 0.95, green: 0.95, blue: 0.95),"Off White"),
 
    ]

    // Static array for foreground colors
    static let foregroundColors: [(topic: TopicColor, color: Color, name: String)] = [
        (.myGold, Color(red: 255/255, green: 223/255, blue: 0/255), "Gold"),
        (.myHotPink, Color(red: 255/255, green: 20/255, blue: 147/255), "Hot Pink"),
        (.myRoyalBlue, Color(red: 65/255, green: 105/255, blue: 225/255), "Royal Blue"),
        (.myDarkOrange, Color(red: 255/255, green: 191/255, blue: 0/255), "Dark Orange"),
        (.myDarkViolet, Color(red: 148/255, green: 0/255, blue: 211/255), "Dark Violet"),
        (.myDarkGreen, Color(red: 0/255, green: 128/255, blue: 0/255), "Dark Green"),
        (.myCrimson, Color(red: 255/255, green: 127/255, blue: 80/255), "Crimson"),
        (.myTeal, Color(red: 70/255, green: 240/255, blue: 220/255), "Teal"),
        (.myNavy, Color(red: 0/255, green: 105/255, blue: 148/255), "Navy"),
        (.myMidnightBlue, Color(red: 135/255, green: 206/255, blue: 235/255), "Midnight Blue"),
        (.myGoldenrod, Color(red: 255/255, green: 255/255, blue: 0/255), "Goldenrod"),
        (.myForestGreen, Color(red: 34/255, green: 139/255, blue: 34/255), "Forest Green"),
        (.myDeepTeal, Color(red: 72/255, green: 209/255, blue: 204/255), "Deep Teal"),
        (.myChocolate, Color(red: 210/255, green: 105/255, blue: 30/255), "Chocolate"),
        (.myBrown, Color(red: 165/255, green: 42/255, blue: 42/255), "Brown"),
        (.myDarkGoldenrod, Color(red: 218/255, green: 165/255, blue: 32/255), "Dark Goldenrod"),
        (.myDarkRed, Color(red: 139/255, green: 0/255, blue: 0/255), "Dark Red"),
        (.myOrangeRed, Color(red: 255/255, green: 117/255, blue: 24/255), "Orange Red"),
        (.mySaddleBrown, Color(red: 149/255, green: 69/255, blue: 53/255), "Saddle Brown"),
        (.myDarkOliveGreen, Color(red: 85/255, green: 107/255, blue: 47/255), "Dark Olive Green"),
        (.myDarkBlue, Color(red: 176/255, green: 224/255, blue: 230/255), "Dark Blue"),
        (.myAliceBlue, Color(red: 25/255, green: 25/255, blue: 112/255), "Alice Blue"),
        (.mySteelBlue, Color(red: 70/255, green: 130/255, blue: 180/255), "Steel Blue"),
        (.myDarkSlateGray, Color(red: 47/255, green: 79/255, blue: 79/255), "Dark Slate Gray"),
        (.myDarkGray, Color(red: 119/255, green: 136/255, blue: 153/255), "Dark Gray"),
        (.myWhite, Color(red: 0/255, green: 0/255, blue: 0/255), "White")
    ]

    // Function to retrieve a background color for a TopicColor
    static func backgroundColor(for topicColor: TopicColor) -> Color {
        return backgroundColors.first(where: { $0.topic == topicColor })?.color ?? Color.clear
    }
    
    // Function to retrieve a foreground color for a TopicColor
    static func foregroundColor(for topicColor: TopicColor) -> Color {
        return foregroundColors.first(where: { $0.topic == topicColor })?.color ?? Color.clear
    }
    
    // Get all available colors as enum values
    static func getAllColors() -> [TopicColor] {
        return TopicColor.allCases
    }
}

let scheme0Colors: [TopicColor] = [
    .myBlack, .myBlack, .myBlack, .myBlack, .myBlack,
    .myBlack, .myBlack, .myBlack, .myBlack, .myBlack,
    .myOffWhite, .myOffBlack
]

let scheme1Colors: [TopicColor] = [
    .myIceBlue, .myMidnightBlue, .myFrost, .mySlate, .mySilver,
    .myPine, .myBerry, .myEvergreen, .myStorm, .myHolly,
    .myOffWhite, .myOffBlack
]

let scheme2Colors: [TopicColor] = [
    .myLightYellow, .myDeepPink, .myLightBlue, .myPeach, .myLavender,
    .myMint, .myLightCoral, .myAqua, .myLemon, .mySkyBlue,
    .myOffWhite, .myOffBlack
]

let scheme3Colors: [TopicColor] = [
    .mySkyBlue, .mySunshineYellow, .myOceanBlue, .mySeafoam, .myPalmGreen,
    .myCoral, .myLagoon, .myShell, .myCoconut, .myPineapple,
    .myOffWhite, .myOffBlack
]

let scheme4Colors: [TopicColor] = [
    .myBurntOrange, .myGoldenYellow, .myCrimsonRed, .myPumpkin, .myChestnut,
    .myHarvestGold, .myAmber, .myMaroon, .myRusset, .myMossGreen,
    .myOffWhite, .myOffBlack
]
let allColorSchemes: [[TopicColor]] = [
  scheme0Colors, scheme1Colors, scheme2Colors, scheme3Colors, scheme4Colors
]
func allColorsForScheme(_ schmindx: Int) -> [TopicColor] {
  return allColorSchemes[schmindx]
}
func colorForSchemeAndTopic(scheme schmindx: Int, index topicIndex: Int) -> TopicColor {
    let theScheme = allColorSchemes[schmindx]
    return theScheme[topicIndex]
}
