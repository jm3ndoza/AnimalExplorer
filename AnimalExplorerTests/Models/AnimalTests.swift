//
//  AnimalTests.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 01/06/2022.
//

import XCTest

class AnimalTests: XCTestCase {

	func testDecoding() throws {
		XCTAssertNotNil(Animal(data: Data(Animal.animalJSON)))
	}
	
	func testModel() throws {
		let animal = Animal.mock
		
		XCTAssertTrue(animal.lifespanInYears == "15 year lifespan")
		XCTAssertTrue(animal.weightMaxInLbs == "90 lbs")
    }
}
