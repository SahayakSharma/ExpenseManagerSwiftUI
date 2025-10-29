//
//  SignUpView.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 27/10/25.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username:String=""
    @State var password:String=""
    @State var confirmPassword:String=""
    
    @EnvironmentObject var authRouter:AuthRouter

    var body: some View {
        VStack{
            Image("expense-tracker")
                .resizable()
                .scaledToFit()
            Spacer()
            
            Text("Create a New Account 😎")
                .font(.headline)
                .fontWeight(.semibold)
            Spacer().frame(height: 50)
            CustomTextInput(textBoundToInputField: $username,placeholderString: "Enter Email ID")
            Spacer().frame(height: 30)
            CustomTextInput(textBoundToInputField: $password,placeholderString: "Password",isSecure: true)
            Spacer().frame(height: 30)
            CustomTextInput(textBoundToInputField: $confirmPassword,placeholderString: "Confirm Pasword",isSecure: true)
            
            Spacer().frame(height: 40)
            
            Button {
                print("this is username",username,password)
            } label: {
                Text("Create New Account")
            }
            .capsuleButtonStyle()
            
            Button {
                authRouter.navigate(to: .signIn)
            } label: {
                Text("Already have an account? Sign In")
                    .font(.custom("linkText", size: 13))
                    .underline()
            }

            Spacer().frame(height: 150)

        }
        .padding(.horizontal,30)
    }}

#Preview {
    SignUpView()
}
