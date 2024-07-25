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
    private init() {
        // for  Model: let publishedAt: Date
        decoder.dateDecodingStrategy = .iso8601
    }
    
    
    //MARK: - Properties
    private let urlNews = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a12c4539f10a4cc18b688217e9c01999"
    private let decoder = JSONDecoder()
    
    //MARK: Method
    func fetchNews() async throws -> NewsModel {
        
        // URL News
        guard let url = URL(string: urlNews) else {
            throw NetworkError.invalidURL
        }
        
        
        // request data tuple
        let (data, response) = try await URLSession.shared.data(from: url)
       
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try decoder.decode(NewsModel.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}
