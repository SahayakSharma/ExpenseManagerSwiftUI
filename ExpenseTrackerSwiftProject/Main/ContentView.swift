//
//  ContentView.swift
//  ExpenseTrackerSwiftProject
//
//  Created by Sahayak Sharma on 31/10/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @ObservedObject var activeRoute:ActiveRouter = ActiveRouter()
    @ObservedObject var authRouter:AuthRouter = AuthRouter()
    @ObservedObject var authViewModel:AuthViewModel = AuthViewModel()
    
    var body: some View {

            if authViewModel.userSession == nil {
                NavigationStack(path: $authRouter.navRouter){
                    InitHomeView()
                        .navigationDestination(for: AuthRouter.AuthRoutes.self) { route in
                            switch route {
                            case .signIn: SignInView()
                            case .signUp: SignUpView()
                            case .resetPassword: ResetPasswordView()
                            }
                        }
                }
                .environmentObject(authRouter)
                .environmentObject(authViewModel)
            }
            else{
                NavigationStack{
                    VStack{
                        Text("Protected routes to be made \(authViewModel.currentUser?.email ?? "default user")...")
                        Button {
                            Task{
                                authViewModel.signOut()
                            }
                        } label: {
                            Text("Sign Out")
                        }

                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
