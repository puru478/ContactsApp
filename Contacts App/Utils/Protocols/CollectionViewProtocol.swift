//
//  CollectionViewProtocol.swift
//  Contacts App
//
//  Created by Purushottam Chandra on 19/03/19.
//  Copyright © 2019 Purushottam Chandra. All rights reserved.
//

import UIKit

protocol CollectionCellRepresentable {
    static func registerCell(collectionView: UICollectionView)
    func cellInstantiate(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func cellSelected(collectionView: UICollectionView, indexPath: IndexPath)
}

extension CollectionCellRepresentable {
    func cellSelected(collectionView _: UICollectionView, indexPath _: IndexPath) {
    }
}
