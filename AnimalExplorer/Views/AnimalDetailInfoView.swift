//
//  AnimalDetailInfoView.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 02/06/2022.
//

import UIKit

class AnimalDetailInfoView: UIView {
	
	private let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalToConstant: 24),
			imageView.heightAnchor.constraint(equalToConstant: 24)
		])
		return imageView
	}()
	
	private let descriptionLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.textColor = .primaryColor
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var body: UIStackView = {
		let hStack = UIStackView(arrangedSubviews: [imageView, Spacer(width: 20), descriptionLabel])
		hStack.alignment = .center
		
		let vStack = UIStackView(arrangedSubviews: [Spacer(height: 5), hStack, Spacer(height: 5)])
		vStack.axis = .vertical
		
		vStack.translatesAutoresizingMaskIntoConstraints = false
		return vStack
	}()
	
	init(image: UIImage?, description: String) {
		super.init(frame: .zero)
		
		imageView.image = image
		descriptionLabel.text = description
		
		addSubview(body)
		
		NSLayoutConstraint.activate([
			body.topAnchor.constraint(equalTo: topAnchor),
			body.bottomAnchor.constraint(equalTo: bottomAnchor),
			body.leadingAnchor.constraint(equalTo: leadingAnchor),
			body.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
