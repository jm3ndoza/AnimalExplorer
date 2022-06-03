//
//  Decodable+API.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

extension Decodable {
	init?(data: Data?) {
		guard let data = data else {
			return nil
		}
		
		do {
			self = try SnakeCaseJSONDecoder().decode(Self.self, from: data)
		} catch {
			print("Failed to decode \(Self.self) error: \(error)")
			return nil
		}
	}
	
	static func array(from data: Data) -> [Self]? {
		do {
			return try SnakeCaseJSONDecoder().decode([Self].self, from: data)
		} catch {
			print("Failed to decode array \(Self.self) error: \(error)")
			return nil
		}
	}
}
