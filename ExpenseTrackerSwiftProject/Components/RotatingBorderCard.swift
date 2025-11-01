
import SwiftUI

struct RotatingBorderCard: View {
    
    var boxWidth: CGFloat = 300
    var boxheight: CGFloat = 500
    var backgroundColor: Color = .black
    var customGradient:LinearGradient = LinearGradient(colors: [.blue,.indigo], startPoint: .top, endPoint: .bottom)
    var strokeLineWidth: CGFloat = 8
    
    @State private var rotationAngle: Double = 0
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(backgroundColor)
                    .frame(width: boxWidth,height: boxheight)
                RoundedRectangle(cornerRadius: 20)
                    .fill(customGradient)
                    .frame(width: 150,height: boxheight+100)
                    .rotationEffect(.degrees(rotationAngle))
                    .mask {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: strokeLineWidth)
                            .frame(width: boxWidth-4,height: boxheight-4)
                    }
        }
        .onAppear{
            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)){
                rotationAngle=360
            }
        }
    }
}

#Preview {
    RotatingBorderCard()
}
