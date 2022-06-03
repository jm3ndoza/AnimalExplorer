//
//  AssetsColors.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 01/06/2022.
//

import Foundation
import UIKit

extension UIColor {
	static let primaryColor = UIColor(named: "PrimaryColor")!
	static let backgroundColor = UIColor(named: "BackgroundColor")!
	static let lineSeparatorColor = UIColor(named: "LineSeparatorColor")!
	static let placeholderImageColor = UIColor(named: "PlaceholderImageColor")!
}

extension UIImage {
	static let globeIcon = UIImage(systemName: "globe.americas", withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
	static let heartIcon = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
	static let leafIcon = UIImage(systemName: "leaf", withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
	static let homeIcon = UIImage(systemName: "house", withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
	static let scaleMassIcon = UIImage(systemName: "scalemass", withConfiguration: UIImage.SymbolConfiguration(weight: .thin))
	
	static let placeholderImage = UIImage(named: "PlaceholderImage")!
}
