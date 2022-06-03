//
//  API+Resource.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation

protocol APIResourceProtocol {
	static var resource: String { get }
	associatedtype I = Identifiable
	associatedtype D = Decodable
	
	static func create(api: APIServiceProtocol,  body: Data, completion: @escaping APIResourceCompletion<D?>)
	static func retrieve(api: APIServiceProtocol, completion: @escaping APIResourceCompletion<[D]>)
	static func update(api: APIServiceProtocol, model: I, body: Data, completion: @escaping APIResourceCompletion<D?>)
	static func delete(api: APIServiceProtocol, model: I, completion: @escaping APIResourceCompletion<D?>)
}
