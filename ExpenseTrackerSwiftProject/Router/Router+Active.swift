
import SwiftUI
import Combine
import FirebaseAuth

final class ActiveRouter:ObservableObject{
    
    @Published var activeRouter:ActiveRoutes = .authentication
    
    enum ActiveRoutes:Hashable,Codable{
        case authentication
        case protected
    }
}
