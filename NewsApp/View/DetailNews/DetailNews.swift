//
//  DetailNews.swift
//  NewsApp
//
//  Created by Lev Vlasov on 25.07.2024.
//

import SwiftUI

struct DetailNews: View {
    
    let article: Article
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ImageDetail(article: article)
            .frame(height: UIScreen.main.bounds.width)
            
               
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                
                if let description = article.description {
                    Text(description)
                        .descriptionFont()
                }
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background)
            .background(GradientAvatar())
        }
    }
}

#Preview {
    DetailNews(article: Article(
        author: "author",
        title: "title",
        description: "description",
        url: "example",
        urlToImage: "https://images.squarespace-cdn.com/content/v1/5cd2555994d71a16b3b6ffc1/1642803335313-63O311G9T2YN1AWH505C/unsplash-image-MoDcnVRN5JU.jpg",
        publishedAt: Date(),
        content: "content"))
}


struct GradientAvatar: View {
    var body: some View {
        GeometryReader { _ in
            LinearGradient(
                colors: [Color(uiColor: .systemBackground), .clear],
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: SizeConstants.avatarHeidth / 4)
        }
    }
}
