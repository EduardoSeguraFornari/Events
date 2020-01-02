//
//  Date+formatedAsShort.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Foundation

extension Date {
    var formatedAsShort: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
