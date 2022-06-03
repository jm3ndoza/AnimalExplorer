//
//  ImageCache.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import Foundation
import UIKit

class ImageCache {
		
	static let shared = ImageCache()
	private let cache: URLCache
	
	private init() {
		let memoryCapacity = 500 * 1024 * 1024; // 700 MB
		let diskCapacity = 500 * 1024 * 1024; // 500 MB
		cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity)
	}
	
	func retrieveImage(withURL url: URL, completion: @escaping (UIImage?) -> Void) {
		guard let data = getCachedImageData(fromURL: url) else {
			loadImage(withURL: url, completion: completion)
			return
		}
		completion(UIImage(data: data))
	}
	
	private func getCachedImageData(fromURL url: URL) -> Data? {
		return cache.cachedResponse(for: URLRequest(url: url))?.data
	}
	
	private func loadImage(withURL url: URL, completion: @escaping (UIImage?) -> Void) {
		var request = URLRequest(url: url)
		APIService.shared.execute(&request) { [weak self] result in
			guard let `self` = self else { return }
			
			switch result {
			case .failure(let error):
				print("Failed to download image. Error: \(error.localizedDescription)")
				completion(nil)
			case .success(let success):
				print("Original image size: \(success.data.size())")
				
				// compressed images as some images are very large this helps improve performance
				guard let imageData = UIImage(data: success.data)?.jpegData(compressionQuality: 0.3) else {
					print("Failed to compress image")
					completion(nil)
					return
				}
				
				print("New image size: \(imageData.size())")
				self.cache.storeCachedResponse(CachedURLResponse(response: success.respone, data: imageData, storagePolicy: .allowed), for: request)
				DispatchQueue.main.async {
					completion(UIImage(data: success.data))
				}
			}
		}
	}
}
