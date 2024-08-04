//
//  AutorizatedViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 27.07.2024.
//
import GoogleSignIn
import Foundation
import FirebaseAuth
import CoreData
import UIKit

final class AutorizationViewModel: ObservableObject {
    
    // Account info
    @Published var checkUserStatus = false 
    @Published var userName = "No name"
    @Published var userDescription = "No description"
    
    // user Avatar
    @Published var userAvatar: Data? = nil
    @Published var isAvatarPickerPresented = false
    @Published var selectedAvatar: UIImage? = nil
  
    
    
    // Error and leave account
    @Published var leaveAlert = false
    @Published var errorAlert = false
    @Published var errorLogin = ""
    @Published var errorSignIn = ""
    @Published var errorLeave = ""
    
  
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
    
    
    func leaveAccount() {
        do {
            try Auth.auth().signOut()
            self.checkUserStatus = false
            self.userName = ""
            self.userDescription = ""
            
            GIDSignIn.sharedInstance.signOut()
            
        } catch {
            self.errorAlert = true
            self.errorLeave = "\(error.localizedDescription)"
            
        }
    }
}
