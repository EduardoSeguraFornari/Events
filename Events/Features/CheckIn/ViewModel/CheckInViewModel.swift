//
//  CheckInViewModel.swift
//  Events
//
//  Created by Eduardo Fornari on 02/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CheckInViewModel {

    private let eventId: String

    var name = BehaviorRelay<String>(value: "")
    var nameValidation = BehaviorRelay<String>(value: "")
    var email = BehaviorRelay<String>(value: "")
    var emailValidation = BehaviorRelay<String>(value: "")

    lazy var isValid: Observable<Bool> = {
        return Observable.combineLatest(self.name.asObservable(), self.email.asObservable()) { name, email in
            return !name.isEmpty && !email.isEmpty
        }
    }()

    // MARK: - Init
    init(eventId: String) {
        self.eventId = eventId
    }

    func doCheckIn() {
        let name = self.name.value
        let email = self.email.value
        let checkIn = CheckIn(eventId: eventId, name: name, email: email)

        let apiProvider = EventsApiProvider()
        apiProvider.request(for: .checkin(checkIn)) { (result) in
            switch result {
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
        }
    }

}
