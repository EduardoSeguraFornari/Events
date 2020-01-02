//
//  Double+formatedAsCurrency.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

extension Double {
    var formatedAsCurrency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .currency
        let currency = numberFormatter.string(from: self as NSNumber)
        return currency ?? String(format: "%.2f", self)
    }
}
