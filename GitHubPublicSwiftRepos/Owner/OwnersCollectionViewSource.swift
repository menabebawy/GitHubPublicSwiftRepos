//
//  PersonsCollectionViewSource.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/30/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import UIKit

final class OwnersCollectionViewSource: NSObject {
    unowned private var collectionView: UICollectionView

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

}

// MARK: - Collection view data source

extension OwnersCollectionViewSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

// MARK: - Collection view delegate

extension OwnersCollectionViewSource: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

}
