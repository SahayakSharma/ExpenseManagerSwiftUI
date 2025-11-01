//
//  HomeView.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 01/11/25.
//
import SwiftUI


struct HomeView: View {
    
    var body: some View{
        MovingGlowEffectText(textToShow: "Welcome! 🙏", textColor: Color.gray, movingGlowColor: Color.white,glowSpeed: 10)
        Spacer()
    }
}

#Preview {
    HomeView()
}
