//
//  AnimalExplorerDetailViewModelTests.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import XCTest

class AnimalExplorerDetailViewModelTests: XCTestCase {

	private let mockAPI = AnimalAPIMockService()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailDisplay() throws {
		let animal = Animal.mock
		let vm = AnimalExplorerDetailViewModel(api: mockAPI, animal: animal)
		
		
		XCTAssertTrue(vm.animalBasicInfo.imageURL == animal.imageLink)
		XCTAssertTrue(vm.animalBasicInfo.location == animal.geoRange)
		
		let icons = vm.animalDetailInfo.map { $0.icon! }
		let iconOrder: [UIImage] = [.heartIcon, .leafIcon, .homeIcon, .scaleMassIcon].compactMap { $0 }
		XCTAssertTrue(icons == iconOrder)
		
		XCTAssertTrue(vm.animalDetailInfo.first(where: {$0.icon == .heartIcon})?.description == animal.lifespanInYears)
		XCTAssertTrue(vm.animalDetailInfo.first(where: {$0.icon == .leafIcon})?.description == animal.diet)
		XCTAssertTrue(vm.animalDetailInfo.first(where: {$0.icon == .homeIcon})?.description == animal.habitat)
		XCTAssertTrue(vm.animalDetailInfo.first(where: {$0.icon == .scaleMassIcon})?.description == animal.weightMaxInLbs)
		
    }
}
