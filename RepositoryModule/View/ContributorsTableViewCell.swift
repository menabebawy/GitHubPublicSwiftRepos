//
//  ContributorsTableViewCell.swift
//  RepositoryModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Entities

final class ContributorsTableViewCell: UITableViewCell {
    @IBOutlet weak private var contributorsCollectionView: UICollectionView!

    var contributors: [Owner] = [] {
        didSet {
            contributorsCollectionView.register(UINib(nibName: "ContributorCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ContributorCell")
            contributorsCollectionView.reloadData()
        }
    }
    
}

// MARK: - Collectio view data source

extension ContributorsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contributors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContributorCell", for: indexPath) as? ContributorCollectionViewCell else {
            return UICollectionViewCell()
        }
        let contributor = contributors[indexPath.row]
        cell.configureContributor(name: contributor.login, avatarUrlString: contributor.avatar_url)
        return cell
    }


}

// MARK: - Collection view delegate

extension ContributorsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

}
