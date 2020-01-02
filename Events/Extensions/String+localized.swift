//
//  String+localized.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
