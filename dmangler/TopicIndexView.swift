//
//  TopicIndexView.swift
//  dmangler
//
//  Created by bill donner on 10/5/24.
//
 
import SwiftUI


struct TopicIndexView: View {
  @Bindable var dmangler:Dmangler
    // Binding to the temporary selected topics
  @Binding var  selectedTopics: [String: MyColor]
  @Binding var  scheme: Int
  @Environment(\.colorScheme) var cs //system light/dark
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
              ForEach(selectedTopics.keys.sorted(), id: \.self) { topic in
                  if let colorEnum = selectedTopics[topic],
                     let topicidx = dmangler.allTopics.firstIndex(where: { $0 == topic }) {
                  //  let _ = print(colorEnum, topicidx)
                    VStack(spacing:0) {
                          let backColor = ColorManager.backgroundColor(for: colorEnum)
                          ZStack{
                            Circle()
                              .fill(backColor)  // Use enum to get Color
                              .frame(width: 70, height: 50)
                            Text("\(dmangler.allCounts[topicidx])")
                              .font(.body)
                              .foregroundColor(optimalTextColor(for: backColor))
                          }
                            Text(topic)
                                .lineLimit(3)
                                .frame(width: 70, height: 50)
                                .foregroundColor(cs == .dark ? .white : .black)
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
      let selectedTopics:[String:MyColor] = [
          "Topic1": .myNavy,
          "Topic2": .myAqua,
          "Topic3": .myMossGreen,
          "Topic4": .myGoldenYellow
        ]
        
      return TopicIndexView(dmangler: load_Dmangler(Dmangler.shared), selectedTopics:.constant (selectedTopics),scheme: .constant(0))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Topic Index View")
            .environment(\.colorScheme, .light)  // Test dark mode with .dark if needed
    }
}
