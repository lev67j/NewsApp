//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import SwiftUI
import Firebase
import CoreData

@main
struct NewsAppApp: App {
    
    init() {
        FirebaseApp.configure()
        
    }
    
    @StateObject private var managerDB = ManagerDB()
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var autorizationVM = AutorizationViewModel()
    
    var body: some Scene {
        WindowGroup {
            DistribiutionView()
                .environment(\.managedObjectContext, managerDB.container.viewContext)
            
                .onAppear {
                    
                    NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main) { _ in
                        saveInCoreData()
                        
                        
                    }
                }
        }
        
    }
    private func saveInCoreData() {
        let context = managerDB.container.viewContext
        
        let fetchRequest: NSFetchRequest<Autorization> = Autorization.fetchRequest()
        
        do {
            // update object
            let results = try context.fetch(fetchRequest)
            
            if let autorization = results.first {
                autorization.userAvatar = autorizationVM.userAvatar
                autorization.userName = autorizationVM.userName
                autorization.userDescription = autorizationVM.userDescription
                print("update object")
            } else {
                // create new object
                let autorization = Autorization(context: context)
                autorization.userDescription = autorizationVM.userDescription
                autorization.userName = autorizationVM.userName
                autorization.userAvatar = autorizationVM.userAvatar
                print("create new object")
            }
            
            try context.save()
            print("data saved in core data successfully")
            
        } catch {
            print("Failed saved data: \(error)")
        }
      
        
        print(  autorizationVM.userDescription,
                autorizationVM.userName,
                "autorizationVM.userAvatar: \(autorizationVM.userAvatar != nil ? "has value" : "no value")"
        )
    }
}

