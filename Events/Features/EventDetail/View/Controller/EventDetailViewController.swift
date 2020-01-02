//
//  EventDetailViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import MapKit
import RxSwift
import UIKit

class EventDetailViewController: UIViewController {

    private var disposeBag = DisposeBag()

    private var locationManager: CLLocationManager?
    private var userLocation: CLLocationCoordinate2D?

    private let eventViewModel: EventViewModel
    private lazy var viewModel: EventDetailViewModel = {
        return EventDetailViewModel(viewModel: eventViewModel)
    }()

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
        bind()
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

    // MARK: - Bind
    private func bind() {

        viewModel.title
            .bind(to: titleLabel.rx.text).disposed(by: disposeBag)

        viewModel.imageURL.subscribe { result in
            if let imageURL = result.element {
                self.coverImageView.loadImage(imageURL)
            }
        }.disposed(by: disposeBag)

        viewModel.date
            .bind(to: dateValueLabel.rx.text).disposed(by: disposeBag)

        viewModel.price
            .bind(to: priceValueLabel.rx.text).disposed(by: disposeBag)

        viewModel.eventDescription
            .bind(to: descriptionLabel.rx.text).disposed(by: disposeBag)

        viewModel.address
            .bind(to: addressValueLabel.rx.text).disposed(by: disposeBag)

        viewModel.location.subscribe { result in
            if let element = result.element, let location = element {
                self.setMap(with: location)
            }
        }.disposed(by: disposeBag)

        viewModel.peopleDataSource.delegate = peopleCollectionView
        peopleCollectionView.dataSource = viewModel.peopleDataSource

        viewModel.couponsDataSource.delegate = couponsCollectionView
        couponsCollectionView.dataSource = viewModel.couponsDataSource
    }

    // MARK: - Map
    private func setMap(with location: CLLocationCoordinate2D) {
        if let altitude = CLLocationDistance(exactly: 2_000) {
            mapView.camera.altitude = altitude
        }
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isUserInteractionEnabled = true
        mapView.showsUserLocation = true
        mapView.setCenter(location, animated: false)
        let annotation = MKPointAnnotation()
        annotation.title = viewModel.title.value
        annotation.coordinate = location
        mapView.addAnnotation(annotation)

        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.startUpdatingLocation()
        }
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

// MARK: - CLLocationManagerDelegate
extension EventDetailViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location.coordinate
        }
    }
}
