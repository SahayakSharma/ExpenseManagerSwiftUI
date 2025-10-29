//
//  InitHomeView.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 26/10/25.
//

import SwiftUI

struct InitHomeView: View {
    @EnvironmentObject var authRouter:AuthRouter
    
    var body: some View {
        VStack{
            Image("expense-tracker-3")
                .resizable()
                .scaledToFit()
            
            Spacer()
                .frame(height: 50)
            
            VStack(spacing: 10){
                Text("Your Daily")
                    .headingTextStyle()
                
                Text("Expense Tracking Solution")
                    .headingTextStyle()
            }
                
            Spacer()
                .frame(height: 100)
            
            Button {
                authRouter.navigate(to: .signIn)
            } label: {
                HStack(spacing: 15){
                    Image(systemName: "person.badge.shield.checkmark.fill")
                        .foregroundColor(Color.black)
                    Text("Sign in to Continue")
                        .foregroundStyle(Color.black)
                }
            }
            .capsuleButtonStyle()

        }
        .padding()
    }
}

#Preview {
    InitHomeView()
        .environmentObject(AuthRouter())
}
