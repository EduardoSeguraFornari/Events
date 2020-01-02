//
//  EventDetailViewController.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    private let eventViewModel: EventViewModel

    // MARK: - Init
    init(viewModel: EventViewModel) {
        self.eventViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
