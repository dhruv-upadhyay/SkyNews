//
//  NewsFeedListViewModel.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import Foundation

class NewsFeedListViewModel: NSObject, ObservableObject {
    @Published var feedItems: [NewsFeedListModel] = []
    @Published var isLoading: Bool = true
    private var currentElement = ""
    private var currentTitle: String = ""
    private var currentDescription: String = ""
    private var currentLink: URL?
    private var currentImageUrl: URL?
    private var completionHandler: (() -> Void)?
    
    override init() {
        super.init()
        fetchNews()
    }
    
    func fetchNews() {
        guard let url = URL(string: "https://feeds.skynews.com/feeds/rss/home.xml") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Failed to fetch data: \(String(describing: error))")
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.isLoading = false
            }
        }
        
        task.resume()
    }
}

extension NewsFeedListViewModel: XMLParserDelegate {
    // MARK: - XMLParserDelegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        
        if elementName == "item" {
            currentTitle = ""
            currentDescription = ""
            currentLink = nil
            currentImageUrl = nil
        }
        
        if elementName == "enclosure", let urlString = attributeDict["url"], let url = URL(string: urlString) {
            currentImageUrl = url
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        func checkHTMLElemnts() -> Bool {
            return (string.contains("href") || string.contains("/a") || string.contains("<") || string.contains(">"))
        }
        
        switch currentElement {
        case "title":
            if !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                if !checkHTMLElemnts() {
                    currentTitle += string
                }
            }
        case "description":
            currentDescription += string
        case "link":
            if let url = URL(string: string.trimmingCharacters(in: .whitespacesAndNewlines)) {
                currentLink = url
            }
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            if let link = currentLink {
                let item = NewsFeedListModel(title: currentTitle, description: currentDescription, link: link, imageUrl: currentImageUrl)
                DispatchQueue.main.async {
                    self.feedItems.append(item)
                }
            }
        }
    }
}
