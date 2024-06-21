//
//  NewsFeedListViewModel.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import Foundation

// ViewModel Class
class NewsFeedListViewModel: NSObject, ObservableObject {
    // Published properties to notify views of changes
    @Published var feedItems: [NewsFeedListModel] = []
    @Published var isLoading: Bool = true

    // Variables to hold the current parsing element and its related data
    private var currentElement = ""
    private var currentTitle: String = ""
    private var currentDescription: String = ""
    private var currentLink: URL?
    private var currentImageUrl: URL?
    private var completionHandler: (() -> Void)?

    // Initializer calls fetchNews to load data on creation
    override init() {
        super.init()
        fetchNews()
    }

    // Method to fetch news data from the provided URL
    func fetchNews() {
        guard let url = URL(string: Common.newsLink) else { return }
        
        // Use the network service to fetch data
        NetworkService.shared.fetchData(from: url) { [weak self] data, response, error in
            guard let data = data else {
                print("\(Messages.failedToFetch) \(String(describing: error))")
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        }
    }
}

// XMLParserDelegate
extension NewsFeedListViewModel: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName

        if elementName == HTMLElements.item {
            currentTitle = ""
            currentDescription = ""
            currentLink = nil
            currentImageUrl = nil
        }

        if elementName == HTMLElements.enclosure, let urlString = attributeDict[Params.url], let url = URL(string: urlString) {
            currentImageUrl = url
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch currentElement {
        case HTMLElements.title:
            if !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                if !string.checkHTMLElemnts() {
                    currentTitle += string
                }
            }
        case HTMLElements.description:
            currentDescription += string
        case HTMLElements.link:
            if let url = URL(string: string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                currentLink = url
            }
        default:
            break
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == HTMLElements.item {
            if let link = currentLink {
                let item = NewsFeedListModel(title: currentTitle, description: currentDescription, link: link, imageUrl: currentImageUrl)
                DispatchQueue.main.async {
                    self.feedItems.append(item)
                }
            }
        }
    }
}

