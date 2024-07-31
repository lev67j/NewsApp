//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import SwiftUI
import Firebase

@main
struct NewsAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @ObservedObject var autorizationVM = AutorizationViewModel()
 
    var body: some Scene {
        WindowGroup {
            if autorizationVM.userAutorization == false {
                HomeView()
            } else {
                HomeView()
            }
        }
    }
}
