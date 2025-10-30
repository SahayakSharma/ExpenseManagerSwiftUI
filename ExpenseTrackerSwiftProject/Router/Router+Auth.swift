
import SwiftUI
import Combine
import FirebaseAuth


final class AuthRouter: ObservableObject {
    
    @Published var navRouter = NavigationPath()
    @Published var routesRec:[AuthRoutes] = []
    

    enum AuthRoutes:Hashable,Codable{
        case signIn
        case signUp
        case resetPassword
    }
    
    func navigate(to route:AuthRoutes){
        navRouter.append(route)
        routesRec.append(route)
    }
    
    func navigateBack(){
        navRouter.removeLast()
        routesRec.removeLast()
    }
    
    func navigateBack(to targetRoute:AuthRoutes){
        guard let lastRoute = routesRec.last, lastRoute == targetRoute else { return }
        var last = routesRec.last
        
        while last != targetRoute {
            routesRec.removeLast()
            navRouter.removeLast()
            last = routesRec.last
        }
    }
    
    func navigateToRoot(){
        navRouter.removeLast(self.navRouter.count)
        routesRec.removeLast(self.routesRec.count)
    }
    
}
