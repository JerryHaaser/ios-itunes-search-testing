//
//  GoodResultsData.swift
//  iTunes SearchTests
//
//  Created by Jerry haaser on 11/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

let goodResultsData = """
{
    "resultCount": 2,
    "results": [
      {
        "trackName": "GarageBand",
        "artistName": "Apple",
      },
      {
        "trackName": "Shortcut: GarageBand Edition",
        "artistName": "Mark Keroles",
    }
  ]
}
""".data(using: .utf8)!

let badResultsData = """
{
    "resultCount": 2,
    "results": [
      
        "trackName": "GarageBand",
        "artistName": "Apple",
      },
      {
        "trackName": "Shortcut: GarageBand Edition",
        "artistName": "Mark Keroles",
    }
  ]
}
""".data(using: .utf8)!

let noResultsData = """
{
    "resultsCount": 0,
    "results": []
}
""".data(using: .utf8)!
