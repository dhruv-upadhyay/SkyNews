//
//  NetworkManager.swift
//  SkyNews
//
//  Created by Dhruv Upadhyay on 21/06/24.
//

import Foundation

// Define a network service class to handle network requests
class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    // Method to fetch data from a given URL
    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: completion)
        task.resume()
    }
}
