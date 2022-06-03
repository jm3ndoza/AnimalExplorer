//
//  UIView+Style.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import Foundation
import UIKit

extension UIView {
	
	class var lineSeparator: UIView {
		let view = UIView()
		view.backgroundColor = .lineSeparatorColor
		NSLayoutConstraint.activate([
			view.heightAnchor.constraint(equalToConstant: 1)
		])
		return view
	}
}
