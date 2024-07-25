//
//  BottomNewsRow.swift
//  NewsApp
//
//  Created by Lev Vlasov on 25.07.2024.
//

import SwiftUI

struct BottomNewsRow: View {
    
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
                            .frame(width: 120, height: 120)
                            .clipShape(.rect(cornerRadius: 10))
                        
                    } else {
                        ZStack {
                            
                            Rectangle()
                                .frame(width: 120, height: 120)
                                .foregroundStyle(.secondary)
                                .opacity(0.3)
                                .clipShape(.rect(cornerRadius: 10))
                            
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundStyle(.secondary)
                                .scaledToFit()
                                .frame(height: 50)
                            
                            
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
        }
        .frame(width: 120, height: 240)
        .padding(10)
        .background(.background)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    HomeView()
}
