//
//  NewsFeedListView.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

struct NewsFeedListView: View {
    @ObservedObject var viewModel = NewsFeedListViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Image("logo-rect")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                }
                .padding([.leading, .trailing], 16)
                
                Divider()
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.feedItems) { item in
                            NewsFeedView(item: item).background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding([.horizontal, .bottom])
                        }
                    }
                }
                .padding([.leading, .trailing], 16)
                .padding([.top], 16)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    NewsFeedListView()
}
