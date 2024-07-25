//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var topNews: [Article] = []
    @Published var bottomNews: [Article] = []
    
    init() {
        receiveTopNews()
        receiveBottomNews() 
    }
    
    //MARK: Methods
    func receiveTopNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.fetchNews(urlString: URLManager.topNews)
                topNews = articles.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
    
    
    func receiveBottomNews() {
        Task {
            do {
                let articles = try await NetworkManager.shared.fetchNews(urlString: URLManager.bottomNews)
                bottomNews = articles.articles
            } catch {
                if let error = error as? NetworkError {
                    print(error)
                }
            }
        }
    }
}
