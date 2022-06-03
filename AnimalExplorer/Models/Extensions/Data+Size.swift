//
//  Data+Size.swift
//  AnimalExplorer
//
//  Created by Jeremiah Mendoza on 03/06/2022.
//

import Foundation

extension Data {
	func size() -> String {
		let countBytes = ByteCountFormatter()
		countBytes.allowedUnits = [.useKB, .useMB, .useGB]
		countBytes.countStyle = .file
		return countBytes.string(fromByteCount: Int64(self.count))
	}
}
