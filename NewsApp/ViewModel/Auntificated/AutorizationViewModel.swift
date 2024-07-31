//
//  AutorizatedViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 27.07.2024.
//

import Foundation
import FirebaseAuth

final class AutorizationViewModel: ObservableObject {
    
    @Published var userAutorization = false
    @Published var errorAlert = false
    @Published var errorLogin = ""
    @Published var errorSignIn = ""
    
    func login(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "failed sign up user")
                self.errorAlert = true
                self.errorLogin = "\(error?.localizedDescription ?? "failed login")"
            }
        }
    }
    
    func signIn(email: String, password: String) {
       Auth.auth().signIn(withEmail: email, password: password) { result, error in
         if error != nil {
             print(error?.localizedDescription ?? "failed login")
             self.errorAlert = true
             self.errorSignIn = "\(error?.localizedDescription ?? "failed login")"
          }
      }
    }
}
