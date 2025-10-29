
import SwiftUI

@main
struct ExpenseTrackerSwiftProjectApp: App {
    @ObservedObject var activeRoute:ActiveRouter = ActiveRouter()
    @ObservedObject var authRouter:AuthRouter = AuthRouter()

    var body: some Scene {
        
                
        WindowGroup {
            if activeRoute.activeRouter == .auth {
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
            }
            else{
                NavigationStack{
                    Text("Protected routes to be made ...")
                }
            }
        }
    }
}


