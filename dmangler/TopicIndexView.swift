//
//  TopicIndexView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//
 
import SwiftUI

struct TopicIndexView: View {
    // Binding to the temporary selected topics
  let  selectedTopics: [String: TopicColor]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(selectedTopics.keys.sorted(), id: \.self) { topic in
                    if let colorEnum = selectedTopics[topic] {
                        VStack {
                            Circle()
                                .fill(ColorManager.color(for: colorEnum))  // Use enum to get Color
                                .frame(width: 70, height: 50)
                            Text(topic)
                                .font(.caption)
                                .lineLimit(3)
                                .frame(width: 70, height: 50)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
struct TopicIndexView_Previews: PreviewProvider {
    static var previews: some View {
     
        // Example selected topics
      let selectedTopics:[String:TopicColor] = [
          "Topic1": .myred,
          "Topic2 isverykibg": .myblue,
          "Topic3": .mygreen,
          "Topic4": .myyellow
        ]
        
      return TopicIndexView(selectedTopics: (selectedTopics))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Topic Index View")
            .environment(\.colorScheme, .light)  // Test dark mode with .dark if needed
    }
}
