//
//  PersonViewModel.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import RxCocoa
import UIKit

class PersonViewModel {

    let person: Person

    lazy var name: BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: person.name)
    }()

    lazy var pictureURL: BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: person.pictureURL)
    }()

    // MARK: - Init
    init(person: Person) {
        self.person = person
    }

}
