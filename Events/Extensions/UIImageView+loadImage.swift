//
//  UIImageView+loadImage.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import Kingfisher

extension UIImageView {
    func loadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        kf.setImage(with: url)
    }
}
