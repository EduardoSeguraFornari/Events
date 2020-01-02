//
//  CouponViewModel.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import RxCocoa
import Foundation

class CouponViewModel {
    private let coupon: Coupon

    lazy var discount: BehaviorRelay<String> = {
        return BehaviorRelay<String>(value: "\(coupon.discount)%")
    }()

    // MARK: - Init
    init(coupon: Coupon) {
        self.coupon = coupon
    }
}
