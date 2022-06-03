//
//  AnimalAPIMockService.swift
//  AnimalExplorerTests
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import Foundation

class AnimalAPIMockService: APIServiceProtocol {
	
	var baseURL: String  = ""
	
	var headers: [String : String] = [:]
	
	var simulateError = false
	
	@discardableResult func execute(_ request: inout URLRequest, completion: @escaping APIServiceCompletion) -> URLSessionDataTask {
		let dummyTask = URLSession.shared.dataTask(with: URLRequest(baseURL: "https://www.google.com"))
		guard !simulateError else  {
			completion(.failure(.init(title: "Sorry something went wrong", message: "Please try again later.")))
			return dummyTask
		}
		
		completion(.success((HTTPURLResponse(), Data(Animal.animalListJSON))))
		return dummyTask
	}
}
