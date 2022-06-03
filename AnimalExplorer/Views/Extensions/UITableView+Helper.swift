//
//  UITableView+Helper.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 31/05/2022.
//

import Foundation
import UIKit


extension UITableView {
	
	func register<CellType: UITableViewCell>(cell cellType: CellType.Type) {
		register(cellType, forCellReuseIdentifier: CellType.identifier)
	}
	
	func dequeue<CellType: UITableViewCell>(cell cellType: CellType.Type, for indexPath: IndexPath) -> CellType {
		dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as! CellType
	}
}
