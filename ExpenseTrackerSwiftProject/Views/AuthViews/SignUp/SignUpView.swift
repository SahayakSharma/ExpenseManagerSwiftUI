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
    
    @EnvironmentObject var authViewModel:AuthViewModel
    @EnvironmentObject var authRouter:AuthRouter
    
    func handleSignUp(){
        Task{
            let result=await authViewModel.createUserWithEmailPassword(email: username, password: password)
            if result{
                authRouter.navigate(to: .signIn)
            }
        }
    }

    var body: some View {
        VStack{
            Image("expense-tracker")
                .resizable()
                .scaledToFit()
            Spacer()
 
            MovingGlowEffectText(textToShow: "Create a New Account ✌️", textColor: Color.black, movingGlowColor: Color.white,fontSize: .headline)
            Spacer().frame(height: 50)
            CustomTextInput(textBoundToInputField: $username,placeholderString: "Enter Email ID")
            Spacer().frame(height: 30)
            CustomTextInput(textBoundToInputField: $password,placeholderString: "Password",isSecure: true)
            Spacer().frame(height: 30)
            CustomTextInput(textBoundToInputField: $confirmPassword,placeholderString: "Confirm Pasword",isSecure: true)
            
            Spacer().frame(height: 40)
            
            Button {
                handleSignUp()
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
        .environmentObject(AuthViewModel())
        .environmentObject(AuthRouter())
}
