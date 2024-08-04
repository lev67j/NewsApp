//
//  SignInGoogleViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 03.08.2024.
//


import GoogleSignIn
import SwiftUI
import FirebaseAuth
import Firebase

final class SignInGoogleViewModel: ObservableObject {
    
  
    @ObservedObject var autorizationVM = AutorizationViewModel()

    init(autorizationVM: AutorizationViewModel) {
        self.autorizationVM = autorizationVM
    }
    
    func signInGoogle() {
        
        // clientID
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // config
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        //  sign In
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController) { user, error in
            if let error = error {
                print(error)
                return
            }
            
            // user, idToken
            guard let user = user?.user,
                  let idToken = user.idToken  else { return }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            // Auth
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print(error)
                    return self.autorizationVM.errorAlert = true
                }
                
                DispatchQueue.main.async {
                    self.autorizationVM.checkUserStatus = true
                    print("checkUserStatus = \(self.autorizationVM.checkUserStatus)")
                }
                
                guard let user = result?.user else { return }
                print(user)
                
               
           }
        }
    }
}
