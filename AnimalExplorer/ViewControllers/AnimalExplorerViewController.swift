//
//  AnimalExplorerViewController.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import UIKit

class AnimalExplorerViewController: UIViewController {

	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 32, weight: .bold)
		label.textColor = .primaryColor
		label.text = "Explore"
		return label
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14, weight: .regular)
		label.textColor = .primaryColor
		label.numberOfLines = 0
		label.text = "Discover and learn about our featured creatures"
		return label
	}()
	
	private lazy var headerStackView: UIStackView = {
		let vStack = UIStackView(arrangedSubviews: [Spacer(height: 20), titleLabel, Spacer(height: 5), descriptionLabel, Spacer(height: 20)])
		vStack.axis = .vertical
		
		let hStackView = UIStackView(
			arrangedSubviews:[
				Spacer(width: 30),
				vStack,
				Spacer(width: 30)
			]
		)
		hStackView.axis = .horizontal
		hStackView.translatesAutoresizingMaskIntoConstraints = false
		return hStackView
	}()
	
	private lazy var refreshControl: UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
		refreshControl.attributedTitle = NSMutableAttributedString(
			string: "Pull to refresh",
			attributes: [
				.foregroundColor : UIColor.primaryColor,
				.font : UIFont.systemFont(ofSize: 10, weight: .regular)
			]
		)
		return refreshControl
	}()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.estimatedRowHeight = 280
		tableView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: 0, right: 3)
		tableView.contentInset = .init(top: 0, left: 0, bottom: 10, right: 0)
		tableView.rowHeight = UITableView.automaticDimension
		tableView.separatorStyle = .none
		tableView.backgroundColor = .clear
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(cell: AnimalExplorerTableViewCell.self)
		
		tableView.addSubview(refreshControl)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()
	
	private let viewModel: AnimalExplorerViewModelProtocol
	
	init(viewModel: AnimalExplorerViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Explore"
		view.backgroundColor = .backgroundColor
		
		view.addSubview(headerStackView)
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
			headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			headerStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
			headerStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
			
			tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		
		refresh()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: false)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	@objc private func refresh() {
		refreshControl.beginRefreshing()
		
		viewModel.refresh { [weak self] in
			guard let `self` = self else { return }
			switch $0 {
			case .failure(let error):
				self.present(UIAlertController(title: error.title, message: error.message, preferredStyle: .alert), animated: true)
			case .success(_):
				self.tableView.reloadData()
				self.refreshControl.endRefreshing()
			}
		}
	}
}

extension AnimalExplorerViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeue(cell: AnimalExplorerTableViewCell.self, for: indexPath)
		let item = viewModel.item(atIndexPath: indexPath)
		cell.set(imageURL: item.imageURL, name: item.name, location: item.location)
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.numberOfItems
	}
}

extension AnimalExplorerViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let vm = viewModel.detailViewModel(atIndexPath: indexPath)
		navigationController?.pushViewController(AnimalExplorerDetailViewController(viewModel: vm), animated: true)
	}
}
