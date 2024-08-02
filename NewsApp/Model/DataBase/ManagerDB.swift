//
//  ManagerDB.swift
//  NewsApp
//
//  Created by Lev Vlasov on 31.07.2024.
//

import CoreData
import Foundation

final class ManagerDB: ObservableObject {
    
    let container = NSPersistentContainer(name: "NewsDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    var managedObjectContext: NSManagedObjectContext {
        return container.viewContext
    }
}
