//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var topNews: [Article] = []
    
    init() {
        receiveNews()
    }
    
    //MARK: Methods
    func receiveNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.fetchNews()
                topNews = articles.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
}
