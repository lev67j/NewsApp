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
        decoder.dateDecodingStrategy = .iso8601
    }
    
    private let decoder = JSONDecoder()
    
    //MARK: Method
    func fetchNews(urlString: String) async throws -> NewsModel {
        
        // URL News
        guard let url = URL(string: urlString) else {
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
