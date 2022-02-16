//
//  StringEmptyChecking.swift
//  Bookworm
//
//  Created by Alex Paz on 16/02/2022.
//

import Foundation

extension String {
    var isTrulyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
