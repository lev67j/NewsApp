//
//  AccountView.swift
//  NewsApp
//
//  Created by Lev Vlasov on 31.07.2024.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var accountVm = AccountViewModel()
    
    var body: some View {
        
        // Add Avatar User
        Button {
            
        } label: {
            Text("Add Avatar User")
        }
        
        // Name User
        TextField("User name", text: $accountVm.userName)
        
       
    }
}

#Preview {
    AccountView()
}
