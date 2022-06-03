//
//  AnimalExplorerViewModel.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation
import UIKit

protocol AnimalExplorerViewModelProtocol {
	
	var numberOfItems: Int { get }
	
	init(api: APIServiceProtocol)
	
	func item(atIndexPath indexPath: IndexPath) -> (name: String, location: String, imageURL: URL)
	func detailViewModel(atIndexPath indexPath: IndexPath) -> AnimalExplorerDetailViewModelProtocol
	func refresh(completion: @escaping ((Result<Void, APIError>) -> Void))
}

class AnimalExplorerViewModel: AnimalExplorerViewModelProtocol {
	
	var numberOfItems: Int {
		items.count
	}
	
	private var items = [Animal]()
	
	private let api: APIServiceProtocol
	
	required init(api: APIServiceProtocol) {
		self.api = api
	}
	
	func item(atIndexPath indexPath: IndexPath) -> (name: String, location: String, imageURL: URL) {
		let item = items[indexPath.row]
		return (item.name, item.geoRange, item.imageLink)
	}
	
	func detailViewModel(atIndexPath indexPath: IndexPath) -> AnimalExplorerDetailViewModelProtocol {
		let item = items[indexPath.row]
		return AnimalExplorerDetailViewModel(api: self.api, animal: item)
	}
	
	func refresh(completion: @escaping ((Result<Void, APIError>) -> Void)) {
		Animal.retrieve(api: api) { [weak self] result in
			guard let `self` = self else { return }
			
			DispatchQueue.main.async {
				switch result {
				case .failure(let error):
					completion(.failure(error))
				case .success(let animals):
					self.items = animals
					completion(.success(()))
				}
			}
		}
	}
}
