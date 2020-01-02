//
//  CouponCollectionViewCell.swift
//  Events
//
//  Created by Eduardo Fornari on 02/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import RxSwift
import UIKit

class CouponCollectionViewCell: UICollectionViewCell {

    private var disposeBag = DisposeBag()

    @IBOutlet private weak var discountLabel: UILabel!

    func configure(viewModel: CouponViewModel) {
        viewModel.discount
            .bind(to: discountLabel.rx.text).disposed(by: disposeBag)
    }

}
