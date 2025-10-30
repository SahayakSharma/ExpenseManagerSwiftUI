
import SwiftUI
import Firebase
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ExpenseTrackerSwiftProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject var activeRoute:ActiveRouter = ActiveRouter()
    @ObservedObject var authRouter:AuthRouter = AuthRouter()
    @ObservedObject var authViewModel:AuthViewModel = AuthViewModel()
    
    var body: some Scene {
        
                
        WindowGroup {
            if authViewModel.currentUser != nil {
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
                    Text("Protected routes to be made ...")
                }
            }
        }
    }
}
