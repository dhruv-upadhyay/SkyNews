//
//  NewsFeedView.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import SwiftUI

struct NewsFeedView: View {
    var item: NewsFeedListModel
    var body: some View {
        VStack(alignment: .leading) {
            Link(destination: item.link) {
                VStack(alignment: .leading) {
                    if let imageUrl = item.imageUrl {
                        AsyncImage(url: imageUrl) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()
                        } placeholder: {
                            ZStack {
                                Image("news-default-palceholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 200)
                                    .clipped()
                                ProgressView()
                            }
                            
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(item.title)
                            .font(.headline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        Text(item.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Spacer()
                            Text("Read more")
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

#Preview {
    NewsFeedView(item: NewsFeedListModel(title: "England have missed out on automatically qualifying for the knockout stages of the Euros tonight after drawing 1-1 to Denmark.", description: "The Three Lions remain on top of Group C with four points and need at least a draw against Slovenia on Tuesday to guarantee a place in the round of 16.", link: URL(string: "https://news.sky.com/story/england-draw-against-denmark-after-squandering-one-goal-lead-13156220")!, imageUrl: URL(string: "https://e3.365dm.com/24/02/2048x1152/skynews-breaking-news-breaking_6449241.jpg?20240209070741")!))
}
