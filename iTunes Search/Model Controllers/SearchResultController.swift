//
//  SearchResultController.swift
//  iTunes Search
//
//  Created by Spencer Curtis on 8/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class SearchResultController {
    
    //Dependancies
    // 1. base URL
    // 2. Search Term and Result type being passed in (Query items)
    // 3. Set up model correctly with proper coding keys (Decoder)
    // 4. URLSession.shared
    
    // MARK: - Properties
    
    let dataLoader: NetworkDataLoader
    let baseURL = URL(string: "https://itunes.apple.com/search")!
    var searchResults: [SearchResult] = []
    var error: Error?
    
    init(dataLoader: NetworkDataLoader = URLSession.shared) {
        self.dataLoader = dataLoader
    }
    
    
    
    func performSearch(for searchTerm: String, resultType: ResultType, completion: @escaping () -> Void) {
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let parameters = ["term": searchTerm,
                          "entity": resultType.rawValue]
        let queryItems = parameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents?.queryItems = queryItems
        
        guard let requestURL = urlComponents?.url else { return }

        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        self.dataLoader.loadData(with: request) { (data, error) in
            
            if let error = error { NSLog("Error fetching data: \(error)")
               // self.error = error
            }
            guard let data = data else { completion(); return }
            
            do {
                let jsonDecoder = JSONDecoder()
                let searchResults = try jsonDecoder.decode(SearchResults.self, from: data)
                self.searchResults = searchResults.results
            } catch {
                print("Unable to decode data into object of type [SearchResult]: \(error)")
                self.error = error
            }
            
            completion()
        }
    }
    

}

// Make sure we are decoding correctly (results > 0)

// Test that it does something with our url

//Check that it generates the correct URL

//Make sure it's working even without internet (Mocking)
