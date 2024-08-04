//
//  TabView.swift
//  NewsApp
//
//  Created by Lev Vlasov on 01.08.2024.
//

import FirebaseAuth
import SwiftUI

struct DistribiutionView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var autorizationVM = AutorizationViewModel()
    
    
    init() {
        checkUser()
    }
    var body: some View {
        
        if autorizationVM.checkUserStatus {
            HomeView()
        } else {
            AutorizationView()
        }
    }
    func checkUser() {
        if Auth.auth().currentUser != nil {
            autorizationVM.checkUserStatus = true
            print("checkUser() = true")
        } else {
            autorizationVM.checkUserStatus = false
            print("checkUser() = false")
        }
    }
}

#Preview {
    DistribiutionView()
}
