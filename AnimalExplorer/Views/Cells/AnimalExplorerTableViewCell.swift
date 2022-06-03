//
//  AnimalExplorerTableViewCell.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import UIKit

class AnimalExplorerTableViewCell: UITableViewCell {
	
	private lazy var animalImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 24
		imageView.backgroundColor = .placeholderImageColor
		imageView.image = .placeholderImage
		
		NSLayoutConstraint.activate([
			imageView.heightAnchor.constraint(equalToConstant: 200)
		])
		
		return imageView
	}()
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 26, weight: .semibold)
		label.adjustsFontSizeToFitWidth = true
		label.textColor = .primaryColor
		return label
	}()
	
	private lazy var globeImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.image = .globeIcon
		
		NSLayoutConstraint.activate([
			imageView.heightAnchor.constraint(equalToConstant: 20),
			imageView.widthAnchor.constraint(equalToConstant: 20)
		])
		
		return imageView
	}()
	
	private let locationLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.textColor = .primaryColor
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var locationStackView: UIStackView = {
		let stackView = UIStackView(
			arrangedSubviews: [
				globeImageView,
				Spacer(width: 5),
				locationLabel
			]
		)
		stackView.axis = .horizontal
		stackView.alignment = .center
		return stackView
	}()
	
	private lazy var animalDetailStackView: UIStackView = {
		let stackView = UIStackView(
			arrangedSubviews: [
				Spacer(height: 10),
				titleLabel,
				locationStackView
			]
		)
		stackView.axis = .vertical
		
		let hStack = UIStackView(arrangedSubviews: [Spacer(width: 5), stackView])
		hStack.axis = .horizontal
		
		return hStack
	}()
	
	private lazy var animalInfoStackView: UIStackView = {
		let stackView = UIStackView(
			arrangedSubviews: [
				Spacer(height: 20),
				animalImageView,
				animalDetailStackView,
				Spacer(height: 20)
			]
		)
		
		stackView.axis = .vertical
		return stackView
	}()
	
	private lazy var body: UIStackView = {
		let stackView = UIStackView(
			arrangedSubviews: [
				Spacer(width: 30),
				animalInfoStackView,
				Spacer(width: 30)
			]
		)
		
		stackView.axis = .horizontal
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = .clear
		
		contentView.addSubview(body)
		
		NSLayoutConstraint.activate([
			body.topAnchor.constraint(equalTo: contentView.topAnchor),
			body.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			body.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			body.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		animalImageView.image = .placeholderImage
	}
	
	func set(imageURL: URL, name: String, location: String) {
		titleLabel.text = name
		locationLabel.text = location
		
		animalImageView.loadImage(from: imageURL) { [weak self] in
			guard let `self` = self else { return }
			self.animalImageView.image = $0
		}
	}
}
