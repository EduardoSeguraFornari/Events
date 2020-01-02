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

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var confirmPresenceLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nameValidationLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var emailValidationLabel: UILabel!
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!

    // MARK: - Init
    init(eventId: String) {
        self.eventId = eventId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - Buttons
    @IBAction func confirmButtonDidTap(_ sender: UIButton) {
        print("Do Check-In")
    }

    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
