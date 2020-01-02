//
//  EventDetailViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import MapKit
import UIKit

class EventDetailViewController: UIViewController {

    private let eventViewModel: EventViewModel

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dateValueLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var priceValueLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var addressValueLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var peopleLabel: UILabel!
    @IBOutlet private weak var peopleCollectionView: UICollectionView! {
        didSet {
            peopleCollectionView.register(of: PersonCollectionViewCell.self)
        }
    }
    @IBOutlet private weak var couponsLabel: UILabel!
    @IBOutlet private weak var couponsCollectionView: UICollectionView! {
        didSet {
            couponsCollectionView.register(of: CouponCollectionViewCell.self)
        }
    }
    @IBOutlet private weak var checkInButton: UIButton!

    // MARK: - Init
    init(viewModel: EventViewModel) {
        self.eventViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
    }

    // MARK: - Navigation Items
    private func setupNavigationItems() {
        title = "Event"
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }

        let shareButton = UIBarButtonItem(barButtonSystemItem: .action,
                                          target: self,
                                          action: #selector(shareButtonDidTap))
        navigationItem.rightBarButtonItems = [shareButton]
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    @IBAction func userLocationButtonDidTap(_ sender: UIButton) {
        print("Location")
    }

    // MARK: - CheckIn
    @IBAction func checkInButtonDidTap(_ sender: UIButton) {
        print("Check-In")
    }

    // MARK: - Share
    @objc private func shareButtonDidTap() {
        print("Share")
    }
}
