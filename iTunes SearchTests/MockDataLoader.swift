//
//  MockDataLoader.swift
//  iTunes SearchTests
//
//  Created by Jerry haaser on 11/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import iTunes_Search

class MockDataLoader: NetworkDataLoader {
    
    var request: URLRequest?
    var data: Data?
    var error: Error?
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.main.async {
            completion(self.data, self.error)
        }
    }
}
