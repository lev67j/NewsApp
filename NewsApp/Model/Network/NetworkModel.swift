//
//  NetworkModel.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import Foundation

// MARK: - News Model
struct NewsModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
}


