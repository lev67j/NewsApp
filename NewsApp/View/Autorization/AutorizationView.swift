//
//  AutorizatedView.swift
//  bakery
//
//  Created by Lev Vlasov on 02.06.2024.
//

import SwiftUI

struct AutorizationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
              NavigationLink {
                    SignUpView()
                } label: {
                    Text("**Sign Up**")
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 50)
                        .background(.blue.opacity(0.6))
                        .clipShape(Capsule())
                }
                
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        
                        Image("facebookLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 20)
                            .imageScale(.large)
                            .padding(6)
                        
                      
                        
                        Text("**Sign in with Facebook**")
                            .padding()
                        
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.black)
                    .clipShape(Capsule())
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                }
                
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        
                        Image("googleLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 20)
                            .imageScale(.large)
                            .padding(6)
                        
                        
                        
                        Text("**Sign in with Google**")
                            .padding()
                        
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.black)
                    .clipShape(Capsule())
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                }
                
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        
                        Image("appleLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 20)
                            .imageScale(.large)
                            .padding(6)
                        
                        
                        
                        Text("**Sign in with Apple**")
                            .padding()
                        
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.black)
                    .clipShape(Capsule())
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                }
                
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
