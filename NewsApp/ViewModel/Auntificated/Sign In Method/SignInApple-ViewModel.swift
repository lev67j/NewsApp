//
//  SignInAppleViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 03.08.2024.
//

import Foundation
import CryptoKit
import AuthenticationServices
import FirebaseAuth

final class SignInAppleViewModel: ObservableObject {
    
    @Published var nonce = ""
    
    
    func auntificate(credentilal: ASAuthorizationAppleIDCredential) {
        
        // get token
        guard let token = credentilal.identityToken else {
            print("error with token")
            
            return
        }
    
        // token string
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("error with tokenString")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
                                                              
         
        Auth.auth().signIn(with: firebaseCredential) { (result, error) in
             
            if let error = error {
                print("error auth().signIn: \(error)")
                return
            }
            
            // success sign in
            print("success sign in")
        }
    }
}

// Helper SignIn Apple

func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
    }.joined()
    
    return hashString
}


func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    var randomBytes = [UInt8](repeating: 0, count: length)
    let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
    if errorCode != errSecSuccess {
        fatalError(
            "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
    }
    
    let charset: [Character] =
    Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    
    let nonce = randomBytes.map { byte in
        // Pick a random character from the set, wrapping around if needed.
        charset[Int(byte) % charset.count]
    }
    
    return String(nonce)
}
