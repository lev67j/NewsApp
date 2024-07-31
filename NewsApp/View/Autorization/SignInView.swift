//
//  EmailView.swift
//  bakery
//
//  Created by Lev Vlasov on 02.06.2024.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var autorizationVM = AutorizationViewModel()
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        if autorizationVM.userAutorization == false {
            signIn
        } else if autorizationVM.userAutorization == true {
            HomeView()
                .navigationBarBackButtonHidden(true)
        }
    }
    
    
    var signIn: some View {
        NavigationStack {
            VStack {
                TextField("**Email addres**", text: $email)
                    .padding()
                    .frame(height: 80)
                    .background(.gray.opacity(0.2))
                    .font(.system(size: 20, weight: .semibold))
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.horizontal)
                
                TextField("**Password**", text: $password)
                    .padding()
                    .frame(height: 80)
                    .background(.gray.opacity(0.2))
                    .font(.system(size: 20, weight: .semibold))
                    .clipShape(.rect(cornerRadius: 15))
                    .padding()
                
                Button {
                    autorizationVM.signIn(email: email, password: password)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if autorizationVM.errorAlert == false {
                            
                            // Save userAutorization in DataBase
                            autorizationVM.userAutorization = true
                            
                        }
                    }
                } label: {
                    Text("**Sign In**")
                        .frame(width: 100, height: 47)
                        .background(.gray.opacity(0.2))
                        .font(.system(size: 20, weight: .semibold))
                        .clipShape(Capsule())
                        .padding([.leading, .bottom, .trailing])
                        .foregroundStyle(.black.opacity(0.3))
                }
                .alert("Error Sign In", isPresented: $autorizationVM.errorAlert) {
                    
                } message: {
                    Text(autorizationVM.errorSignIn)
                }
            }
            .navigationTitle("Sign In")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
#Preview {
    SignInView()
}


