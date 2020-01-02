//
//  EventListViewModel.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation
import UIKit

class EventListViewModel {

    private weak var delegate: EventsViewController?

    lazy var eventsDataSource: CollectionViewDataSource<EventCollectionViewCell, EventViewModel> = {
        return CollectionViewDataSource { cell, viewModel in
            cell.configure(viewModel: viewModel)
        }
    }()

    // MARK: - Init
    init(delegate: EventsViewController? = nil) {
        self.delegate = delegate
        load()
    }

    func load() {
        let apiProvider = EventsApiProvider()
        apiProvider.request(for: EventsApiGetEndpoint.events) { [weak self] (result: Result<[Event], Error>) in

            self?.delegate?.stopRefresh()

            switch result {
            case .success(let events):
                let eventViewModels = events.compactMap({ event -> EventViewModel? in
                    return EventViewModel(event: event)
                })
                self?.setup(with: eventViewModels)
            case .failure(let error):
                self?.setup(with: [])
                print(error.localizedDescription)
            }
        }
    }

    private func setup(with viewModels: [EventViewModel]) {
        DispatchQueue.main.async {
            self.eventsDataSource.updateItems(viewModels)
        }
    }

    func model(at index: Int) -> EventViewModel {
        return eventsDataSource.model(at: index)
    }

}
