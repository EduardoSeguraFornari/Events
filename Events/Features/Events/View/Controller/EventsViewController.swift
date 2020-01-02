//
//  ViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    private let viewModel = EventListViewModel()

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.register(of: EventCollectionViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
        bind()
    }

    // MARK: - Navigation Items
    private func setupNavigationItems() {
        title = "Events"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

    // MARK: - Bind
    private func bind() {
        viewModel.eventsDataSource.delegate = collectionView
        collectionView.dataSource = viewModel.eventsDataSource
    }

}

// MARK: - UICollectionViewDelegate
extension EventsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventViewModel = viewModel.model(at: indexPath.row)
        print(eventViewModel.title.value)
    }
}
