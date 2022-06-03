//
//  URLRequest+API.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

extension URLRequest {
	init(baseURL: String,
		 path: String? = nil,
		 queries: [String: Any]? = nil,
		 headers: [String: Any]? = nil,
		 body: Data? = nil,
		 method: APIHTTPMethod = .get,
		 cachePolicy: CachePolicy? = nil,
		 timeoutInterval: Double? = nil) {
		
		var url = baseURL
		
		if let path = path {
			url = "\(url)/\(path)"
		}
		
		let base = URL(string: url)!
		self.init(url: base)
		
		if let queries = queries {
			var urlComponent = URLComponents(string: base.absoluteString)
			urlComponent?.queryItems = queries.map {
				URLQueryItem(name: $0.key, value: String(describing: $0.value))
			}
			
			self.url = urlComponent!.url
		}
		
		if let headers = headers {
			headers.forEach { self.setValue(String(describing: $0.value), forHTTPHeaderField: $0.key) }
		}
		
		if let body = body {
			self.httpBody = body
		}
		
		self.httpMethod = method.rawValue
		self.cachePolicy = cachePolicy ?? .reloadIgnoringLocalAndRemoteCacheData
		self.timeoutInterval = timeoutInterval ?? 30
	}
}
