//
//  CheckinViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 02/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import UIKit

class CheckinViewController: UIViewController {

    private let eventId: String

    // MARK: - Init
    init(eventId: String) {
        self.eventId = eventId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
