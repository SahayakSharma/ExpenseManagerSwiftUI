//
//  SwiftUIView.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 26/10/25.
//

import SwiftUI

extension View{
    func capsuleButtonStyle() -> some View {
        self
            .frame(maxWidth: .infinity)
            .padding(.horizontal,30)
            .padding(.vertical,17)
            .background(Color.yellow)
            .clipShape(.capsule)
            .fontWeight(.semibold)
            .foregroundStyle(Color.black)
    }
    
    func headingTextStyle()-> some View{
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.green)
    }
    
    func gradientBackground()-> some View{
        ZStack{
            Color.clear.ignoresSafeArea()
            self
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.yellow,.white]), startPoint: .top, endPoint: .bottom)
        )
    }
    
    func ignoreSafeAreaWithBgColor(bgColor:Color) -> some View{
        ZStack{
            Color(bgColor).ignoresSafeArea()
            self
        }
    }
}
