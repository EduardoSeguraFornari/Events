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

    enum CheckInValidation {
        case name(String)
        case email(String)
    }

    private weak var delegate: CheckinViewController?

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
    init(eventId: String, delegate: CheckinViewController? = nil) {
        self.eventId = eventId
        self.delegate = delegate
    }

    private(set )var validations: [CheckInValidation] = []

    func validade() {
        validations = []
        if name.value.isEmpty {
            let validation = CheckInValidation.name("Please enter your name".localized)
            validations.append(validation)
        } else {
            nameValidation.accept("")
        }

        if email.value.isEmpty {
            let validation = CheckInValidation.email("Please enter your email".localized)
            validations.append(validation)
        } else if !email.value.isValidEmail() {
            let validation = CheckInValidation.email("Please enter a valid email address".localized)
            validations.append(validation)
        } else {
            emailValidation.accept("")
        }

        for validation in validations {
            switch validation {
            case .name(let message):
                nameValidation.accept(message)
            case .email(let message):
                emailValidation.accept(message)
            }
        }
    }

    func doCheckIn() {
        validade()
        if validations.isEmpty {
            let name = self.name.value
            let email = self.email.value
            let checkIn = CheckIn(eventId: eventId, name: name, email: email)

            let apiProvider = EventsApiProvider()
            apiProvider.request(for: .checkin(checkIn)) { [delegate] (result) in
                switch result {
                case .success:
                    delegate?.showCheckInSuccessMessage()
                case .failure:
                    delegate?.showCheckInErrorMessage()
                }
            }
        } else {
            delegate?.showValidationMessage()
        }
    }

}
