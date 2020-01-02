//
//  UIViewControler+share.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

extension UIViewController {
    func share(items: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true)
    }
}
