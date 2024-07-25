//
//  ContentView.swift
//  NewsApp
//
//  Created by Lev Vlasov on 24.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Properties
    @StateObject var homeVM = HomeViewModel()
    
    //MARK: UI
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(homeVM.topNews, id: \.url) { article in
                            VStack {
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
                                
                                VStack(alignment: .leading) {
                                    Text(article.title)
                                    
                                    Spacer()
                                    
                                    Text(article.publishedAt.convertDate())
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: 260, height: 260)
                            .padding(10)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(.secondary.opacity(0.2))
        }
    }
}

#Preview {
    HomeView()
}

//MARK: Extension
extension Date {
    func convertDate() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}
