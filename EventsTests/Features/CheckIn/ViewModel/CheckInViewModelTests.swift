//
//  CheckInViewModelTests.swift
//  EventsTests
//
//  Created by Eduardo Fornari on 02/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import XCTest
@testable import Events

class CheckInViewModelTests: XCTestCase {

    func testValidationWithEmptyNameAndEmail() {
        let viewModel = CheckInViewModel(eventId: "1")
        viewModel.validade()
        let numberOfValidations = viewModel.validations.count
        let nameValidation = viewModel.nameValidation.value
        let emailValidation = viewModel.emailValidation.value
        XCTAssertEqual(numberOfValidations, 2)
        XCTAssertTrue(!nameValidation.isEmpty)
        XCTAssertTrue(!emailValidation.isEmpty)
    }

    func testValidationWithEmptyEmail() {
        let viewModel = CheckInViewModel(eventId: "1")
        viewModel.name.accept("John")

        viewModel.validade()
        let numberOfValidations = viewModel.validations.count
        let nameValidation = viewModel.nameValidation.value
        let emailValidation = viewModel.emailValidation.value
        XCTAssertEqual(numberOfValidations, 1)
        XCTAssertTrue(nameValidation.isEmpty)
        XCTAssertTrue(!emailValidation.isEmpty)
    }

    func testValidationWithEmptyName() {
        let viewModel = CheckInViewModel(eventId: "1")
        viewModel.email.accept("john@john.com")

        viewModel.validade()
        let numberOfValidations = viewModel.validations.count
        let nameValidation = viewModel.nameValidation.value
        let emailValidation = viewModel.emailValidation.value
        XCTAssertEqual(numberOfValidations, 1)
        XCTAssertTrue(!nameValidation.isEmpty)
        XCTAssertTrue(emailValidation.isEmpty)
    }

    func testValidationWithInvalidEmail() {
        let viewModel = CheckInViewModel(eventId: "1")
        viewModel.name.accept("John")
        viewModel.email.accept("john@john")

        viewModel.validade()
        let numberOfValidations = viewModel.validations.count
        let nameValidation = viewModel.nameValidation.value
        let emailValidation = viewModel.emailValidation.value
        XCTAssertEqual(numberOfValidations, 1)
        XCTAssertTrue(nameValidation.isEmpty)
        XCTAssertTrue(!emailValidation.isEmpty)
    }

    func testValitionOK() {
        let viewModel = CheckInViewModel(eventId: "1")
        viewModel.name.accept("John")
        viewModel.email.accept("john@john.com")

        viewModel.validade()
        let numberOfValidations = viewModel.validations.count
        let nameValidation = viewModel.nameValidation.value
        let emailValidation = viewModel.emailValidation.value
        XCTAssertEqual(numberOfValidations, 0)
        XCTAssertTrue(nameValidation.isEmpty)
        XCTAssertTrue(emailValidation.isEmpty)
    }

}
