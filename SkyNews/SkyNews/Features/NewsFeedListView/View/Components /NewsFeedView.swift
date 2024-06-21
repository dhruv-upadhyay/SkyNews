//
//  NewsFeedView.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

// NewsFeedView displays a single news item, including its image, title, description, and a "Read More" link.
struct NewsFeedView: View {
    
    // The news item to be displayed
    var item: NewsFeedListModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Link to the news item's URL
            Link(destination: item.link) {
                VStack(alignment: .leading) {
                    
                    // Display the news item's image if available
                    if let imageUrl = item.imageUrl {
                        AsyncImage(url: imageUrl) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: Sizes.s200)
                                .clipped()
                        } placeholder: {
                            
                            // Placeholder image and progress indicator while loading
                            ZStack {
                                Image(Images.newsDefaultPlaceholder)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: Sizes.s200)
                                    .clipped()
                                ProgressView()
                            }
                        }
                    }
                    
                    // Display the news item's title and description
                    VStack(alignment: .leading, spacing: Sizes.s8) {
                        Text(item.title)
                            .font(.headline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        Text(item.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                        // "Read More" link at the bottom right
                        HStack {
                            Spacer()
                            Text(Titles.readMore)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

// Preview
#Preview {
    NewsFeedView(item: NewsFeedListModel(title: MockData.newsTitle, description: MockData.newsDesc, link: MockData.newsLink, imageUrl: MockData.newsImage))
}
