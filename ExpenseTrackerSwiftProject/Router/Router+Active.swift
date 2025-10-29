
import SwiftUI
import Combine

final class ActiveRouter:ObservableObject{
    
    @Published var activeRouter:ActiveRoutes = .auth
    
    enum ActiveRoutes:Hashable,Codable{
        case auth
        case protected
    }
}
