//
//  PersonCollectionViewCell.swift
//  Events
//
//  Created by Eduardo Fornari on 01/01/20.
//  Copyright © 2020 Eduardo Fornari. All rights reserved.
//

import RxSwift
import UIKit

class PersonCollectionViewCell: UICollectionViewCell {

    private let disposeBag = DisposeBag()

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var pictureImageView: UIImageView!

    func configure(viewModel: PersonViewModel) {
        viewModel.name
            .bind(to: nameLabel.rx.text).disposed(by: disposeBag)

        viewModel.pictureURL.subscribe { result in
            if let pictureURL = result.element {
                self.pictureImageView.loadImage(pictureURL)
            }
        }.disposed(by: disposeBag)
    }

}
