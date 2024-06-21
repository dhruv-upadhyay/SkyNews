//
//  String.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 20/06/24.
//

import Foundation

// Extension to the String class to provide additional functionalities.
extension String {
    // Function to remove HTML tags from the string and return plain text.
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            return attributed.string
        } catch {
            return nil
        }
    }
    
    // Function to check if the string contains any HTML elements.
    func checkHTMLElemnts() -> Bool {
        return (self.contains("href") || self.contains("/a") || self.contains("<") || self.contains(">"))
    }
}

