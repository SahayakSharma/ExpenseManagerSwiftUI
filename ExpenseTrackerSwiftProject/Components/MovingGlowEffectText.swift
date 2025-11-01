//
//  MovingGlowEffectText.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 01/11/25.
//

import SwiftUI

struct MovingGlowEffectText: View {
    @State private var move:Bool = true
    var textToShow:String
    var textColor:Color
    var movingGlowColor:Color
    var glowSpeed:Double = 5
    var fontSize:Font = .largeTitle
    
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 20,height: 100)
                .foregroundStyle(movingGlowColor)
                .blur(radius: 10)
                .frame(maxWidth: .infinity, alignment: move ? .leading : .trailing)
                .background(textColor)
                .onAppear(){
                    withAnimation(.easeInOut(duration: glowSpeed).repeatForever(autoreverses: false)){
                        move.toggle()
                    }
                }
                .mask {
                    Text(textToShow)
                        .font(fontSize)
                        .bold()
                        .fontDesign(.monospaced)
                }
        }
    }
}

#Preview {
    MovingGlowEffectText(textToShow: "hellow world",textColor: Color.red,movingGlowColor: Color.brown)
}
