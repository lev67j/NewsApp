//
//  AutorizationDB.swift
//  NewsApp
//
//  Created by Lev Vlasov on 01.08.2024.
//

import SwiftUI
import CoreData

public class AutorizationDB: NSManagedObject {
    @NSManaged var userDescription: String?
    @NSManaged var userName: String
    @NSManaged var userAvatar: Data?
}
