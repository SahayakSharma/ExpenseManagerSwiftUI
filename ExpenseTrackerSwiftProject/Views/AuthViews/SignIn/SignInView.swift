//
//  SignInView.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 27/10/25.
//

import SwiftUI

struct SignInView: View {
    
    @State var username:String=""
    @State var password:String=""
    @EnvironmentObject var authRouter:AuthRouter
    @EnvironmentObject var authViewModel:AuthViewModel
    

    var body: some View {
        VStack{
            Image("expense-tracker-2")
                .resizable()
                .scaledToFit()
            Spacer()
            
            Text("Sign in to Your Account 💁")
                .font(.headline)
                .fontWeight(.semibold)
            Spacer().frame(height: 50)
            CustomTextInput(textBoundToInputField: $username,placeholderString: "Enter your username or email")
            Spacer().frame(height: 40)
            CustomTextInput(textBoundToInputField: $password,placeholderString: "Password")
            Spacer().frame(height: 40)
            
            Button {
                Task{
                    await authViewModel.signInWithEmailPassword(email: username, password: password)
                }
            } label: {
                Text("Confirm SignIn")
            }
            .capsuleButtonStyle()
            
            Button {
                authRouter.navigate(to: .signUp)
            } label: {
                Text("Do not have an account? Sign Up")
                    .font(.custom("linkText", size: 13))
                    .underline()
            }

            Spacer().frame(height: 150)

        }
        .padding(.horizontal,30)
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthRouter())
}
