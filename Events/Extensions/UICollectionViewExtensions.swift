//
//  UICollectionViewExtensions.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(of type: T.Type) {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(cellForItemAt indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath)
        guard let resultCell = cell as? T else {
            fatalError("Couldn't load cell with \(T.identifier) identifier")
        }
        return resultCell
    }
}
