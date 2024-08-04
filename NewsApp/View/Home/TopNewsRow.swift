//
//  TopNewsRow.swift
//  NewsApp
//
//  Created by Lev Vlasov on 25.07.2024.
//

import SwiftUI

struct TopNewsRow: View {
    
    //MARK: Properties
    let article: Article
    
    
    //MARK: UI
    var body: some View {
        VStack {
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 260, height: 150)
                            .clipShape(.rect(cornerRadius: 10))
                        
                    } else {
                        ZStack {
                            
                            Rectangle()
                                .frame(height: 150)
                                .foregroundStyle(.secondary)
                                .clipShape(.rect(cornerRadius: 10))
                                .opacity(0.3)
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 30)
                        }
                    }
                }
            }
            
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titleFont()
                
                Spacer()
                
                Text(article.publishedAt.convertDate())
                    .descriptionFont()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 260, height: 260)
        .padding(10)
        .background(.background)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    HomeView()
}
