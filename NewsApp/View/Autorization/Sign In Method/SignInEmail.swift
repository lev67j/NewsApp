//
//  SignInEmail.swift
//  NewsApp
//
//  Created by Lev Vlasov on 02.08.2024.
//

import SwiftUI

struct SignInEmail: View {
    var body: some View {
        NavigationLink {
            SignInView()
        } label: {
            Text("**Sign In**")
                .foregroundStyle(.white)
                .frame(width: 300, height: 40)
                .background(.blue.opacity(0.6))
                .clipShape(Capsule())
        }
    }
}

#Preview {
    SignInEmail()
}
