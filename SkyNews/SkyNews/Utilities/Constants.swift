//
//  Constants.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 21/06/24.
//

import Foundation

// Images: contains asset names used in the app.
struct Images {
    static let newsDefaultPlaceholder: String = "news-default-palceholder"
    static let logoRect: String = "logo-rect"
    static let logo: String = "logo"
}

// Sizes: contains static CGFloat constants for various sizes used throughout the app.
struct Sizes {
    static let s2: CGFloat = 2
    static let s5: CGFloat = 5
    static let s8: CGFloat = 8
    static let s10: CGFloat = 10
    static let s16: CGFloat = 16
    static let s80: CGFloat = 80
    static let s200: CGFloat = 200
}

// Params: static string constants representing parameter keys used in the app.
struct Params {
    static let url = "url"
}

// Titles: contains static strings for various titles used in the app.
struct Titles {
    static let readMore = "Read More"
}

// Messages: static string constants for various messages displayed in the app.
struct Messages {
    static let failedToFetch = "Failed to fetch data:"
}

// Common: contains static string constants for common values used throughout the app.
struct Common {
    static let newsLink = "https://feeds.skynews.com/feeds/rss/home.xml"
}

// HTMLElements: static string constants representing HTML element names used in parsing.
struct HTMLElements {
    static let item = "item"
    static let enclosure = "enclosure"
    static let title = "title"
    static let description = "description"
    static let link = "link"
}

// MockData
struct MockData {
    static let newsTitle = "England have missed out on automatically qualifying for the knockout stages of the Euros tonight after drawing 1-1 to Denmark."
    static let newsDesc = "The Three Lions remain on top of Group C with four points and need at least a draw against Slovenia on Tuesday to guarantee a place in the round of 16."
    static let newsLink = URL(string: "https://news.sky.com/story/england-draw-against-denmark-after-squandering-one-goal-lead-13156220")!
    static let newsImage = URL(string: "https://e3.365dm.com/24/02/2048x1152/skynews-breaking-news-breaking_6449241.jpg?20240209070741")!
}

