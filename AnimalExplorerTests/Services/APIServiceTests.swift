//
//  APIServiceTests.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import XCTest

class APIServiceTests: XCTestCase {
	
    func testMandatoryHeaders() throws {
		var request = URLRequest(baseURL: "www.google.com")
		APIService.shared.execute(&request, completion: { _ in })
		
		XCTAssertTrue(APIService.shared.headers == request.allHTTPHeaderFields)
    }
}
