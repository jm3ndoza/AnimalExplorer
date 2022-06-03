//
//  URLRequest+APITests.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 01/06/2022.
//

import XCTest

class URLRequest_APITests: XCTestCase {

	func testURLRequestDefaultValue() throws {
		let request = URLRequest(
			baseURL: "https://www.someurl.com",
			method: .get
		)
		
		XCTAssertTrue(request.timeoutInterval == 30)
		XCTAssertTrue(request.cachePolicy == .reloadIgnoringLocalAndRemoteCacheData)
	}
	
	func testURLRequestConstruction() throws {
		let path = "search"
        
		let request = URLRequest(
			baseURL: "https://www.someurl.com",
			path: path,
			queries: ["name": "john smith", "age": 21],
			headers: APIService.shared.headers,
			body: Data(),
			method: .get,
			cachePolicy: .returnCacheDataDontLoad,
			timeoutInterval: 5
		)
		
		XCTAssertTrue(request.url!.scheme!.contains("https"))
		XCTAssertTrue(request.url!.host!.contains("www.someurl.com"))
		XCTAssertTrue(request.url!.path.contains(path))
		XCTAssertTrue(request.url!.absoluteString.contains("age=21"))
		XCTAssertTrue(request.url!.absoluteString.contains("name=john%20smith"))
		XCTAssertTrue(request.cachePolicy == .returnCacheDataDontLoad)
		XCTAssertTrue(request.timeoutInterval == 5)
		XCTAssertNotNil(request.httpBody)
		
		XCTAssertTrue(request.allHTTPHeaderFields == APIService.shared.headers)
    }
}
