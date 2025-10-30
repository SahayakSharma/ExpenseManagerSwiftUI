import SwiftUI
import FirebaseAuth
import Combine

@MainActor
final class AuthViewModel:ObservableObject{
    
    @Published var currentUser:FirebaseAuth.User?
    @Published var Error:FirebaseAuth.AuthErrors?
    
    private let auth:FirebaseAuth.Auth = Auth.auth()
    
    init(){
        Task{
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async{
        if let user=auth.currentUser{
            currentUser=user
        }
    }
    
    func signInWithEmailPassword(email:String,password:String) async -> Bool{
        do{
            try await auth.signIn(withEmail: email, password: password)
            await loadCurrentUser()
            return true
        }catch{
            Error=error as? FirebaseAuth.AuthErrors
            return false
        }
    }
    
    func createUserWithEmailPassword(email:String,password:String) async -> Bool{
        do{
            _=try await auth.createUser(withEmail: email, password: password)
            return true
        }catch{
            Error=error as? FirebaseAuth.AuthErrors
            return false
        }
    }
}
