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

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        emailTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }

    // MARK: - Buttons
    @IBAction func confirmButtonDidTap(_ sender: UIButton) {
        print("Do Check-In")
    }

    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true)
    }

    // MARK: - Keyboard Observers
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide),
                                               name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    @objc func keyboardDidShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo ?? [:]
        if let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {

            let cancelButtonFrame = cancelButton.frame
            let cancelButtonBottomPosition = cancelButtonFrame.origin.y + cancelButtonFrame.height
            let keyboardTopPosition = keyboardFrame.origin.y - keyboardFrame.height
            let difference = cancelButtonBottomPosition - keyboardTopPosition

            if difference > 0 {
                let margin: CGFloat = 15
                scrollView.contentInset.bottom = difference + margin
                scrollView.scrollIndicatorInsets.bottom = difference + margin

                if nameTextField.isFirstResponder {
                    scrollView.scrollRectToVisible(nameTextField.frame, animated: true)
                } else if emailTextField.isFirstResponder {
                    scrollView.scrollRectToVisible(emailTextField.frame, animated: true)
                }
            } else {
                scrollView.contentInset.bottom = 0
                scrollView.scrollIndicatorInsets.bottom = 0
            }
        }
    }

    @objc func keyboardDidHide(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.bottom = 0
    }

}

// MARK: - UITextFieldDelegate
extension CheckinViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            view.endEditing(true)
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField {
            scrollView.scrollRectToVisible(nameTextField.frame, animated: true)
        } else if textField == emailTextField {
            scrollView.scrollRectToVisible(emailTextField.frame, animated: true)
        }
    }
}
