//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import SwiftUI
//import Firebase

@main
struct NewsAppApp: App {
    
    init() {
     //   FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            AutorizationView()
        }
    }
}
