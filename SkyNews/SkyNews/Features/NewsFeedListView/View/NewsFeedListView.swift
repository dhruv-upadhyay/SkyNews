//
//  NewsFeedListView.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

// NewsFeedListView displays a list of news items, fetched from the view model.
struct NewsFeedListView: View {
    
    // ObservedObject to keep track of the view model's state
    @ObservedObject var viewModel = NewsFeedListViewModel()
    
    var body: some View {
        ZStack {
            
            // Show a loading indicator while data is being fetched
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(Sizes.s2)
            }
            
            VStack(alignment: .leading, spacing: Sizes.s2) {
                
                // Display the logo at the top of the list
                HStack {
                    Image(Images.logoRect)
                        .resizable()
                        .scaledToFit()
                        .frame(height: Sizes.s80)
                }
                .padding([.leading, .trailing], Sizes.s16)
                
                Divider()
                
                // Scroll view to display the list of news items
                ScrollView {
                    LazyVStack {
                        
                        // Iterate through the feed items and display each one using NewsFeedView
                        ForEach(viewModel.feedItems) { item in
                            NewsFeedView(item: item).background(Color.white)
                                .cornerRadius(Sizes.s10)
                                .shadow(radius: Sizes.s5)
                                .padding([.horizontal, .bottom])
                        }
                    }
                }
                .padding([.leading, .trailing, .top], Sizes.s16)
            }
            .background(Color.white)
        }
    }
}

// Preview
#Preview {
    NewsFeedListView()
}
