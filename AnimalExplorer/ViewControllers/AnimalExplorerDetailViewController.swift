//
//  AnimalExplorerDetailViewController.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import UIKit

class AnimalExplorerDetailViewController: UIViewController {
	
	private lazy var heroImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.backgroundColor = .placeholderImageColor
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 24
		imageView.image = .placeholderImage
		
		imageView.loadImage(from: viewModel.animalBasicInfo.imageURL) { [weak self] in
			imageView.image = $0
		}
		
		NSLayoutConstraint.activate([
			imageView.heightAnchor.constraint(equalToConstant: 250)
		])
		
		return imageView
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 26, weight: .semibold)
		label.adjustsFontSizeToFitWidth = true
		label.textColor = .primaryColor
		label.text = viewModel.animalBasicInfo.name
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
	
	private lazy var locationLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.adjustsFontSizeToFitWidth = true
		label.textColor = .primaryColor
		
		label.text = viewModel.animalBasicInfo.location
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
		return stackView
	}()
	
	private lazy var animalInfoStackView: UIStackView = {
		let infoStackView = UIStackView(arrangedSubviews: [
			Spacer(height: 25),
			titleLabel,
			locationStackView,
			Spacer(height: 25),
			.lineSeparator,
			Spacer(height: 25)
		])
		
		var detailViews: [UIView] = viewModel.animalDetailInfo.map { AnimalDetailInfoView(image: $0.icon, description: $0.description) }
		detailViews.append(Spacer())
		detailViews.forEach { infoStackView.addArrangedSubview($0) }
		
		infoStackView.axis = .vertical
		
		let hStack = UIStackView(arrangedSubviews: [Spacer(width: 5), infoStackView, Spacer(width: 5)])
		hStack.axis = .horizontal
		
		return hStack
	}()
	
	private lazy var body: UIStackView = {
		let vStack = UIStackView(arrangedSubviews: [Spacer(height: 20), heroImageView, animalInfoStackView, Spacer()])
		vStack.axis = .vertical
		
		let hStack = UIStackView(arrangedSubviews: [Spacer(width: 30), vStack, Spacer(width: 30)])
		hStack.translatesAutoresizingMaskIntoConstraints = false
		return hStack
	}()

	private let viewModel: AnimalExplorerDetailViewModelProtocol
	
	init(viewModel: AnimalExplorerDetailViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .backgroundColor
		
		view.addSubview(body)
		
		NSLayoutConstraint.activate([
			body.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			body.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			body.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			body.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
}
