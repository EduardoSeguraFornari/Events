//
//  UIView&UIViewController+lock+unlock.swift
//
//  Copyright © 2018 Eduardo Fornari. All rights reserved.
//

import UIKit

extension UIView {
    private static let backdropViewTag = 1001
    private static let activityViewTag = 1002

    func lock() {
        let backdrop = UIView()
        backdrop.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)
        backdrop.tag = UIView.backdropViewTag

        addSubview(backdrop)

        backdrop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backdrop.centerXAnchor.constraint(equalTo: centerXAnchor),
            backdrop.centerYAnchor.constraint(equalTo: centerYAnchor),
            backdrop.leadingAnchor.constraint(equalTo: leadingAnchor),
            backdrop.trailingAnchor.constraint(equalTo: trailingAnchor),
            backdrop.topAnchor.constraint(equalTo: topAnchor),
            backdrop.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let activityView = UIActivityIndicatorView()
        activityView.style = .whiteLarge
        activityView.color = .white
        activityView.tag = UIView.activityViewTag
        activityView.startAnimating()

        addSubview(activityView)

        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func unlock() {
        self.viewWithTag(UIView.backdropViewTag)?.removeFromSuperview()
        self.viewWithTag(UIView.activityViewTag)?.removeFromSuperview()
    }
}

extension UIViewController {
    func lock() {
        view.lock()
    }

    func unlock() {
        view.unlock()
    }
}
