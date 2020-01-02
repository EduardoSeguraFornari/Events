//
//  EventDetailViewModel.swift
//  Events
//
//  Created by Eduardo Fornari on 02/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import CoreLocation
import Foundation
import RxCocoa

class EventDetailViewModel {

    var eventId: BehaviorRelay<String>

    var title: BehaviorRelay<String>

    var imageURL: BehaviorRelay<String>

    var date = BehaviorRelay<String>(value: "")

    var price = BehaviorRelay<String>(value: "")

    var eventDescription = BehaviorRelay<String>(value: "")

    lazy var peopleDataSource: CollectionViewDataSource<PersonCollectionViewCell, PersonViewModel> = {
        return CollectionViewDataSource { cell, viewModel in
            cell.configure(viewModel: viewModel)
        }
    }()

    lazy var couponsDataSource: CollectionViewDataSource<CouponCollectionViewCell, CouponViewModel> = {
        return CollectionViewDataSource { cell, viewModel in
            cell.configure(viewModel: viewModel)
        }
    }()

    var location = BehaviorRelay<CLLocationCoordinate2D?>(value: nil)
    var address = BehaviorRelay<String>(value: "")

    // MARK: - Init
    init(viewModel: EventViewModel) {
        eventId = viewModel.eventId
        title = viewModel.title
        imageURL = viewModel.imageURL

        load(with: viewModel.eventId.value)
    }

    private func load(with eventId: String) {
        let apiProvider = EventsApiProvider()
        apiProvider.request(for:
        EventsApiGetEndpoint.event(identifier: eventId)) { [weak self] (result: Result<EventDetail, Error>) in

            switch result {
            case .success(let eventDetail):
                self?.setup(with: eventDetail)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func setup(with eventDetail: EventDetail) {
        DispatchQueue.main.async {
            self.eventId.accept(eventDetail.identifier)
            self.title.accept(eventDetail.title)
            self.imageURL.accept(eventDetail.imageURL)
            self.date.accept(eventDetail.date.formatedAsShort)
            self.price.accept(eventDetail.price.formatedAsCurrency)
            self.eventDescription.accept(eventDetail.eventDescription)

            let latitude = eventDetail.latitude
            let longitude = eventDetail.longitude
            if let latitudeDegrees = CLLocationDegrees(exactly: latitude),
                let longitudeDegrees = CLLocationDegrees(exactly: longitude) {
                let location = CLLocationCoordinate2D(latitude: latitudeDegrees, longitude: longitudeDegrees)
                self.location.accept(location)
                location.getAddress { (address, _) in
                    if let address = address {
                        self.address.accept(address.description)
                    }
                }
            }

            let people = eventDetail.people.compactMap { person -> PersonViewModel? in
                return PersonViewModel(person: person)
            }
            self.peopleDataSource.updateItems(people)

            let coupons = eventDetail.coupons.compactMap { coupon -> CouponViewModel? in
                return CouponViewModel(coupon: coupon)
            }
            self.couponsDataSource.updateItems(coupons)
        }
    }

}
