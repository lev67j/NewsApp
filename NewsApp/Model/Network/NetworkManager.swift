//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import Foundation


final class NetworkManager {
     
    //MARK: - Singlton
    static let shared = NetworkManager()
 
    
    //MARK: - Private Init
    private init() {}
    
    
    //MARK: - Properties
    private let urlNews = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a12c4539f10a4cc18b688217e9c01999"
    
    
    //MARK: Method
    func fetchNews() {
        
        // URL News
        guard let url = URL(string: urlNews) else {
            return
        }
        
        
        
    }
}
