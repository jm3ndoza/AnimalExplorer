//
//  UIImageView+Helper.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 01/06/2022.
//

import Foundation
import UIKit

extension UIImageView {
	func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
		ImageCache.shared.retrieveImage(withURL: url, completion: completion)
	}
}
