//
//  TopicIndexView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//
 
import SwiftUI

struct TopicIndexView: View {
  let dmangler:Dmangler
    // Binding to the temporary selected topics
let selectedTopics: [String: TopicColor]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(selectedTopics.keys.sorted(), id: \.self) { topic in
                  if let colorEnum = selectedTopics[topic],
                     let topicidx = dmangler.allTopics.firstIndex(where: { $0 == topic }) {
                        VStack {
                          ZStack{
                            Circle()
                              .fill(ColorManager.backgroundColor(for: colorEnum))  // Use enum to get Color
                              .frame(width: 70, height: 50)
                            Text("\(dmangler.allCounts[topicidx])") .font(.body)
                              .foregroundColor(.primary)
                          }
                            Text(topic)
                               
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
          "Topic1": .myNavy,
          "Topic2": .myAqua,
          "Topic3": .myMossGreen,
          "Topic4": .myGoldenYellow
        ]
        
      return TopicIndexView(dmangler: load_Dmangler(Dmangler.shared), selectedTopics: (selectedTopics))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Topic Index View")
            .environment(\.colorScheme, .light)  // Test dark mode with .dark if needed
    }
}
