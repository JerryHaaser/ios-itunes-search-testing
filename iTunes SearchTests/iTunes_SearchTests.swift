//
//  iTunes_SearchTests.swift
//  iTunes SearchTests
//
//  Created by Jerry haaser on 11/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

// Does decoding work
// Does decoding fail when given bad data
// does it build the correct URL
// does it build the correct URLRequest
// are results saved properly
// Is completion handler called if networking fails
// is the completion handler called if data is bad
// is completin handler called if data is good

class iTunes_SearchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testForSomeResults() {
        let mock = MockDataLoader()
        mock.data = goodResultsData
        
        let controller = SearchResultController(dataLoader: mock)
        
        let resultsExpectation = expectation(description: "Wait for results")
        controller.performSearch(for: "GarageBand", resultType: .software) {
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 2)
        //Now check results
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting 2 results for GarageBand")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
    }
    
    func testBadResultData() {
        let mock = MockDataLoader()
        mock.data = badResultsData
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectations = expectation(description: "Wait for search results")
        controller.performSearch(for: "GarageBand", resultType: .software) {
            resultsExpectations.fulfill()
        }
        
        wait(for: [resultsExpectations], timeout: 2)
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results from garageBand using bad data")
        XCTAssertNotNil(controller.error)
    }
    
    func testNoResults() {
        let mock = MockDataLoader()
        mock.data = noResultsData
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectations = expectation(description: "Wait for search results")
        controller.performSearch(for: "abcde12345", resultType: .software) {
            resultsExpectations.fulfill()
        }
        
        wait(for: [resultsExpectations], timeout: 2)
        XCTAssertTrue(controller.searchResults.count == 0, "Expecting no results")
        XCTAssertNil(controller.error)
    }

}
