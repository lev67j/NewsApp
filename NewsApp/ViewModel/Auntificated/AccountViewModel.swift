//
//  AccountViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 31.07.2024.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var userName = ""
    @Published var userImage = ""
    @Published var userDescription = ""
    
}
