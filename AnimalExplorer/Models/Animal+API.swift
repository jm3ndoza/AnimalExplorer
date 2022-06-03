//
//  Animal+API.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

extension Animal: APIResourceProtocol {
	static let resource = "animals"
	
	static func create(api: APIServiceProtocol, body: Data, completion: @escaping APIResourceCompletion<Animal?>) {
		
	}
	
	static func update(api: APIServiceProtocol, model: Animal, body: Data, completion: @escaping APIResourceCompletion<Animal?>) {
		
	}
	static func delete(api: APIServiceProtocol, model: Animal, completion: @escaping APIResourceCompletion<Animal?>) {
		
	}
	
	static func retrieve(api: APIServiceProtocol, completion: @escaping APIResourceCompletion<[Animal]>) {
		var request = URLRequest(baseURL: api.baseURL,
								 path: "\(resource)/rand/\(10)",
								 method: .get,
								 cachePolicy: .reloadIgnoringLocalCacheData,
								 timeoutInterval: 20)
		
		api.execute(&request) { result in
			switch result {
			case .failure(let error):
				completion(.failure(error))
			case .success(let success):
				guard let animals = Animal.array(from: success.data) else {
					completion(.failure(.init(title: "Unable to decide animals")))
					return
				}
				completion(.success(animals))
			}
		}
	}
}
