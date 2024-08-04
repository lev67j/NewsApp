//
//  SignInGoogle.swift
//  NewsApp
//
//  Created by Lev Vlasov on 02.08.2024.
//

import SwiftUI
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore
import GoogleSignIn


struct SignInGoogle: View {
    
    @ObservedObject var signInGoogleVM = SignInGoogleViewModel(autorizationVM: AutorizationViewModel())
   
    var body: some View {
    
        // Sign in with Google
        GoogleSignInButton(viewModel: GoogleSignInButtonViewModel()) {
            signInGoogleVM.signInGoogle()
        }
        .foregroundStyle(.white)
        .frame(width: 300, height: 40)
        .background(.black)
        .clipShape(Capsule())
        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
    }
}


#Preview {
    SignInGoogle()
}

