//
//  APIError.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

enum APIServiceError: Error {
	case serviceError(String = "Sorry something went wrong")
	case internalError(APIError)
}


struct APIError: Error, Decodable {
	let title: String
	let message: String?
	
	init(title: String, message: String? = nil) {
		self.title = title
		self.message = message
	}
}
