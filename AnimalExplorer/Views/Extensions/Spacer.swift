//
//  Spacer.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 01/06/2022.
//

import UIKit

class Spacer: UIView {
	
	init(width: CGFloat) {
		super.init(frame: .zero)
		
		NSLayoutConstraint.activate([
			self.widthAnchor.constraint(equalToConstant: width)
		])
	}
	
	init(height: CGFloat) {
		super.init(frame: .zero)
		
		NSLayoutConstraint.activate([
			self.heightAnchor.constraint(equalToConstant: height)
		])
	}
	
	init() {
		super.init(frame: .zero)
		
		setContentHuggingPriority(.defaultLow, for: .horizontal)
		setContentHuggingPriority(.defaultLow, for: .vertical)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
