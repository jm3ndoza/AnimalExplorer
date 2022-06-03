//
//  Animal+Mock.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 01/06/2022.
//

import Foundation

extension Animal {
	static let animalJSON =
	"""
	  {
		 "name":"African Lion",
		 "latin_name":"Panthera leo",
		 "animal_type":"Mammal",
		 "active_time":"Diurnal",
		 "length_min":"8.5",
		 "length_max":"10",
		 "weight_min":"330",
		 "weight_max":"530",
		 "lifespan":"16",
		 "habitat":"Savannah, woodland, and desert",
		 "diet":"Hoofed mammals, hares, small birds and reptiles",
		 "geo_range":"Africa",
		 "image_link":"https://upload.wikimedia.org/wikipedia/commons/7/73/Lion_waiting_in_Namibia.jpg",
		 "id":3
	  }
	""".utf8
	
	static let animalListJSON =
	"""
	  [
		 {
			"name":"Visayan Warty Pig",
			"latin_name":"Sus cebifrons",
			"animal_type":"Mammal",
			"active_time":"Nocturnal",
			"length_min":"3",
			"length_max":"4",
			"weight_min":"55",
			"weight_max":"90",
			"lifespan":"15",
			"habitat":"Rainforest",
			"diet":"Fruits, roots and crops",
			"geo_range":"Philippines",
			"image_link":"https://upload.wikimedia.org/wikipedia/commons/8/89/VisayanWartyPig01.jpg",
			"id":183
		 },
		 {
			"name":"Blue-crowned Laughing Thrush",
			"latin_name":"Garrulax galbanus courtoisi",
			"animal_type":"Bird",
			"active_time":"Diurnal",
			"length_min":"0.7",
			"length_max":"0.8",
			"weight_min":"0.1",
			"weight_max":"0.15",
			"lifespan":"30",
			"habitat":"Grassland and scrubland",
			"diet":"Fruits, berries, and insects",
			"geo_range":"Southern Asia",
			"image_link":"https://upload.wikimedia.org/wikipedia/commons/8/84/Blue-crowned_Laughingthrush_10.jpg",
			"id":39
		 }
	  ]
	""".utf8
	
	static let mock = mockList.first!
	static let mockList = Animal.array(from: Data(animalListJSON))!
}
