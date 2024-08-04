//
//  ImageDetail.swift
//  NewsApp
//
//  Created by Lev Vlasov on 25.07.2024.
//

import SwiftUI

struct ImageDetail: View {
    
    let article: Article
    
    var body: some View {
        GeometryReader { reader in
            if let url = article.urlToImage, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -reader.frame(in: .global).minY)
                            .frame(width: SizeConstants.screenWidth, height: reader.frame(in: .global).minY + SizeConstants.avatarHeidth + 10)
                    }
                }
            }
        }
    }
}
