//
//  UIViewController+presentSimpleAlert.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentSimpleAlert(title: String? = nil, message: String? = nil, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true)
    }
}
