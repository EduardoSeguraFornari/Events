//
//  EventCollectionViewCell.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import RxSwift
import UIKit

class EventCollectionViewCell: UICollectionViewCell {

    private let disposeBag = DisposeBag()

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coverImageView: UIImageView!

    func configure(viewModel: EventViewModel) {
        viewModel.title
            .bind(to: titleLabel.rx.text).disposed(by: disposeBag)

        viewModel.imageURL.subscribe { result in
            if let imageURL = result.element {
                self.coverImageView.loadImage(imageURL)
            }
        }.disposed(by: disposeBag)
    }

}
