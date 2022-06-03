//
//  AnimalExplorerDetailViewModel.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation
import UIKit

struct AnimalDetailBasicInfo {
	let imageURL: URL
	let name: String
	let location: String
}

struct AnimalDetailInfo {
	let icon: UIImage?
	let description: String
}

protocol AnimalExplorerDetailViewModelProtocol {
	
	var animalBasicInfo: AnimalDetailBasicInfo { get }
	var animalDetailInfo: [AnimalDetailInfo] { get }
	
	init(api: APIServiceProtocol, animal: Animal)
}

class AnimalExplorerDetailViewModel: AnimalExplorerDetailViewModelProtocol {
	
	var animalBasicInfo: AnimalDetailBasicInfo {
		.init(imageURL: animal.imageLink, name: animal.name, location: animal.geoRange)
	}
	
	var animalDetailInfo: [AnimalDetailInfo] {
		[
			.init(icon: .heartIcon, description: animal.lifespanInYears),
			.init(icon: .leafIcon, description: animal.diet),
			.init(icon: .homeIcon, description: animal.habitat),
			.init(icon: .scaleMassIcon, description: animal.weightMaxInLbs)
		]
	}
	
	
	private let animal: Animal
	private let api: APIServiceProtocol
	
	required init(api: APIServiceProtocol, animal: Animal) {
		self.api = api
		self.animal = animal
	}
}
