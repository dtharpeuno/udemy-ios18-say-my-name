//
//  StringExt.swift
//  BBQuotes
//
//  Created by dtharpeuno on 12/30/25.
//

import Foundation

extension String {
	func removeSpaces() -> String {
		return self.replacingOccurrences(of: " ", with: "")
	}
	
	func removeCaseAndSpace() -> String {
		return self.removeSpaces().lowercased()
	}
}
