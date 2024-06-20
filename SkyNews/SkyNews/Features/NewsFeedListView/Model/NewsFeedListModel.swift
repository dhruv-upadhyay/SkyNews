//
//  NewsFeedListModel.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import Foundation

struct NewsFeedListModel: Identifiable {
    let id = UUID() // Unique identifier for each instance of FeedItemsModel
    let title: String // The title of the feed item
    let description: String // A longer description of feed item
    let link: URL // The URL link for more content
    let imageUrl: URL? // The URL for the feed image
}

