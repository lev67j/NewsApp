//
//  SignInApple.swift
//  NewsApp
//
//  Created by Lev Vlasov on 02.08.2024.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import CryptoKit


struct SignInApple: View {
    
    @ObservedObject var signInAppleVM = SignInAppleViewModel()
    @ObservedObject var autorizationVM = AutorizationViewModel()
  
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        
        // Sign in with Apple
        SignInWithAppleButton { request in
            
            handleSignInWithAppleRequest(request)
            
        } onCompletion: { result in
            
            handleSignInWithAppleCompletion(result)
            
        }
        .foregroundStyle(.white)
        .frame(width: 300, height: 40)
        .clipShape(Capsule())
    }
    
    func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
        signInAppleVM.nonce = randomNonceString()
        request.nonce = sha256(signInAppleVM.nonce)
    }
    
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let user):
        
            guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                print("error credentialApple")
                return
            }
            
            signInAppleVM.auntificate(credentilal: credential)
                
                autorizationVM.checkUserStatus = true
                print("Apple Button:  autorizationVM.checkUserStatus = true")
           
        case .failure(let error):
            print(error)
        }
    }
}

#Preview {
    SignInApple()
}

/*
// id
let userId = credentialApple.user

// Info
let email = credentialApple.email
let firstName = credentialApple.fullName?.givenName
let lastName = credentialApple.fullName?.familyName

self.userId = userId
self.email = email ?? ""
self.firstName = firstName ?? ""
self.lastName = lastName ?? ""
*/
