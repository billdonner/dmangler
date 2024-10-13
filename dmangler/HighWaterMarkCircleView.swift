import SwiftUI

struct HighWaterMarkCircleView: View {
    let percentage: Double  // Value between 0 and 1
    let size: CGFloat       // Circle size
    
    var body: some View {
        ZStack {
            // Background circle with gradient filling based on percentage
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .mask(
                    Rectangle()
                        .frame(height: size * percentage)
                        .offset(y: size * (1 - percentage) / 2)  // Align high water mark to bottom
                )
                .frame(width: size, height: size)
            
            // Border circle
            Circle()
                .stroke(Color.gray, lineWidth: size * 0.05)
                .frame(width: size, height: size)
            
            // Show the percentage as text inside the circle
            Text("\(Int(percentage * 100))%")
                .font(.system(size: size * 0.2, weight: .bold))
                .foregroundColor(.primary)
        }
    }
}