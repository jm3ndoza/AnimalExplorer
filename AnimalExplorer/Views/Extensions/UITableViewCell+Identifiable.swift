//
//  UITableViewCell+Identifiable.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation
import UIKit

protocol IdentifiableCell {
	
	static var identifier: String { get }
}

extension UITableViewCell: IdentifiableCell {
	static var identifier: String {
		"\(Self.self)"
	}
}
