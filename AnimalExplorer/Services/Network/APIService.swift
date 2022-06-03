//
//  APIService.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

enum APIHTTPMethod: String {
	case get = "GET"
	case put = "PUT"
	case post = "POST"
	case delete = "DELETE"
}

typealias APIResult<SuccessType> = Result<SuccessType, APIError>
typealias APIResourceCompletion<SuccessType> = (APIResult<SuccessType>) -> ()

typealias APIServiceSuccess = (respone: HTTPURLResponse, data: Data)
typealias APIServiceCompletion = (Result<(APIServiceSuccess), APIError>) -> ()

protocol APIServiceProtocol {
	var baseURL: String { get }
	var headers: [String: String] { get }
	@discardableResult func execute(_ request: inout URLRequest, completion: @escaping APIServiceCompletion) -> URLSessionDataTask
}

class APIService: APIServiceProtocol {
	
	var baseURL: String {
		"https://zoo-animal-api.herokuapp.com"
	}
	
	var headers: [String : String] {
		var headers = [
			"Content-Type" : "application/json",
			"Accept" : "application/json"
		]
		
		if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
			headers["App-Version"] = appVersion
		}
		
		return headers
	}
	
	static let shared = APIService()
	
	private let session: URLSession
	
	private init() {
		let configuration = URLSessionConfiguration.default
		
		// define caching
		// configuration.urlCache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "")
		
		self.session = URLSession(configuration: configuration)
	}
	
	@discardableResult func execute(_ request: inout URLRequest, completion: @escaping APIServiceCompletion) -> URLSessionDataTask {
		headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
		
		let task = session.dataTask(with: request) { data, response, error in
			if let error = error {
				completion(.failure(.init(title: error.localizedDescription)))
			} else {
				guard let response = response as? HTTPURLResponse else {
					completion(.failure(.init(title: "Failed to cast HTTPURLResponse")))
					return
				}
				
				switch response.statusCode {
				case 200..<400:
					guard let data = data else {
						completion(.failure(.init(title: "Unable to retrieve data")))
						return
					}
					completion(.success((response, data)))
				default:
					guard let apiError = APIError(data: data) else {
						completion(.failure(.init(title: "Unable to handle APIError")))
						return
					}
					completion(.failure(apiError))
				}
			}
		}
		task.resume()
		return task
	}
}
