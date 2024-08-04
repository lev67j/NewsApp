//
//  AutorizatedView.swift
//  bakery
//
//  Created by Lev Vlasov on 02.06.2024.
//

import SwiftUI
import AuthenticationServices
import GoogleSignInSwift

struct AutorizationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var autorizationVM = AutorizationViewModel()
    
    var body: some View {
        if autorizationVM.checkUserStatus {
            HomeView()
                .navigationBarBackButtonHidden(true)
        } else {
            autorization
        }
    }
    
    var autorization: some View {
        NavigationStack {
            VStack {
                
                
                // Sign in with Email
                SignInEmail()
                
                // Sign in with Google
                SignInGoogle()
                
                // Sign in with Apple
                SignInApple()
                
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("**Login**")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}



#Preview {
     AutorizationView()
}
