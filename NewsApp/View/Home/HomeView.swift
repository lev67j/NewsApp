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
                
                // Top News
                Text("Top News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(homeVM.topNews, id: \.url) { article in
                            NavigationLink {
                                DetailNews(article: article)
                            } label: {
                                TopNewsRow(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
                
                
                // Background News
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(homeVM.bottomNews, id: \.url) { article in
                            NavigationLink {
                                DetailNews(article: article)
                            } label: {
                                BottomNewsRow(article: article)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
            }
            .background(.secondary.opacity(0.2))
            .refreshable {
                homeVM.receiveBottomNews()
                homeVM.receiveTopNews()
            }
        }
    }
}

#Preview {
    HomeView()
}
