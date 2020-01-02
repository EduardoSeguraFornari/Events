//
//  ViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
    }

    // MARK: - Navigation Items
    private func setupNavigationItems() {
        title = "Events"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}
