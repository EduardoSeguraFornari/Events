//
//  CollectionViewDataSource.swift
//
//  Copyright © 2019 Eduardo Fornari. All rights reserved.
//

import UIKit

class CollectionViewDataSource<CellType, ViewModel>: NSObject,
UICollectionViewDataSource where CellType: UICollectionViewCell {

    weak var delegate: UICollectionView?
    private var items: [ViewModel] = []
    private let configureCell: (CellType, ViewModel) -> Void

    // MARK: - Init
    init(delegate: UICollectionView? = nil, configureCell: @escaping (CellType, ViewModel) -> Void) {
        self.delegate = delegate
        self.configureCell = configureCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CellType = collectionView.dequeueReusableCell(cellForItemAt: indexPath)
        let viewModel = items[indexPath.row]
        configureCell(cell, viewModel)
        return cell
    }

    func updateItems(_ items: [ViewModel]) {
        self.items = items
        self.delegate?.reloadData()
    }

    func model(at index: Int) -> ViewModel {
        return items[index]
    }
}
