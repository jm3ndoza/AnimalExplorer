//
//  Animal.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

struct Animal: Codable, Identifiable {
	let id: Int
	let name: String
	let imageLink: URL
	let latinName: String
	let animalType: String
	let lifespan: String
	let habitat: String
	let weightMax: String
	let lengthMax: String
	let diet: String
	let geoRange: String
	
	var weightMaxInLbs: String {
		"\(weightMax) lbs"
	}
	
	var lifespanInYears: String {
		"\(lifespan) year lifespan"
	}
}
