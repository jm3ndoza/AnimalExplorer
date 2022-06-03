//
//  SnakeCaseJSONDecoder.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

class SnakeCaseJSONDecoder: JSONDecoder {
	override init() {
		super.init()
		self.keyDecodingStrategy  = .convertFromSnakeCase
	}
}
