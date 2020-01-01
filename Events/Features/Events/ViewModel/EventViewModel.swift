//
//  EventViewModel.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import RxCocoa
import UIKit

class EventViewModel {
    private let event: Event

    lazy var eventId: BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: event.identifier)
    }()

    lazy var title: BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: event.title)
    }()

    lazy var imageURL: BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: event.imageURL)
    }()

    // MARK: - Init
    init(event: Event) {
        self.event = event
    }

}
