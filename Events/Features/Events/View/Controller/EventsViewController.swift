//
//  ViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    private lazy var viewModel: EventListViewModel = {
        return EventListViewModel(delegate: self)
    }()

    let refreshControl = UIRefreshControl()

    @IBOutlet private weak var pullToRefreshLabel: UILabel!

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.register(of: EventCollectionViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        localize()
        setupNavigationItems()
        bind()
    }

    // MARK: - Localize
    private func localize() {
        title = "App name".localized
        pullToRefreshLabel.text = "Pull to refresh".localized
    }

    // MARK: - Navigation Items
    private func setupNavigationItems() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

    // MARK: - Bind
    private func bind() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching events...".localized)

        viewModel.eventsDataSource.delegate = collectionView
        collectionView.dataSource = viewModel.eventsDataSource
    }

    // MARK: - Alerts
    func didntLoadEvents() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshControl.endRefreshing()

            let title = "Sorry, we couldn't load the events list. Please try again in a few minutes.".localized
            self.presentSimpleAlert(title: title, buttonTitle: "OK")

            self.pullToRefreshLabel.isHidden = false
        }
    }

    func didLoadEvents() {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.pullToRefreshLabel.isHidden = true
        }
    }

    @objc private func refresh() {
        viewModel.load()
    }
}

// MARK: - UICollectionViewDelegate
extension EventsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventViewModel = viewModel.model(at: indexPath.row)
        let viewController = EventDetailViewController(viewModel: eventViewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
