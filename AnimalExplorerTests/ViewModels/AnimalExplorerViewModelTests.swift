//
//  AnimalExplorerViewModelTests.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import XCTest

class AnimalExplorerViewModelTests: XCTestCase {
		
	private let mockAPI = AnimalAPIMockService()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDisplayInfoAtIndexPath() throws {
		let vm = AnimalExplorerViewModel(api: mockAPI)
		vm.refresh { _ in
			let firstAnimal = Animal.mockList.first!
			
			let item = vm.item(atIndexPath: IndexPath(row: 0, section: 0))
			
			XCTAssertTrue(firstAnimal.name == item.name)
			XCTAssertTrue(firstAnimal.imageLink == item.imageURL)
			XCTAssertTrue(firstAnimal.geoRange == item.location)
		}
    }
}
