//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Jerry haaser on 11/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    // Question: What do we need for data in/data out?
    //Need back: Data and Error
    // Provide: URLRequest
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
    
    
}
