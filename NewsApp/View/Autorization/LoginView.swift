//
//  SignInView.swift
//  bakery
//
//  Created by Lev Vlasov on 02.06.2024.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var autorizationVM = AutorizationViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
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
                    //   HomeView()
                    
                    autorizationVM.login(email: email, password: password)
                } label: {
                    Text("**Login**")
                        .frame(width: 100, height: 47)
                        .background(.gray.opacity(0.2))
                        .font(.system(size: 20, weight: .semibold))
                        .clipShape(Capsule())
                        .padding([.leading, .bottom, .trailing])
                        .foregroundStyle(.black.opacity(0.3))
                }
            }
            .navigationTitle("Login")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LoginView()
}
