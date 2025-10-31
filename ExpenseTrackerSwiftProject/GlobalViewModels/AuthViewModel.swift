import SwiftUI
import FirebaseAuth
import Combine

@MainActor
final class AuthViewModel:ObservableObject{
    
    @Published var userSession:FirebaseAuth.User?=nil
    @Published var Error:FirebaseAuth.AuthErrors?=nil
    @Published var currentUser:UserModel?=nil
    
    private let auth:FirebaseAuth.Auth = Auth.auth()
    
    init(){
        Task{
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async{
        if let user=auth.currentUser{
            userSession=user
            currentUser=UserModel(id: user.uid, fullName: user.displayName ?? "default display name", email: user.email ?? "default email", phoneNumber: user.phoneNumber ?? "default phone number", photoURL: user.photoURL?.absoluteString ?? "default photo url")
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
    
    func signOut(){
        do{
            try auth.signOut()
            userSession=nil
            currentUser=nil
        }
        catch{
            Error=error as? FirebaseAuth.AuthErrors
        }
    }
}
