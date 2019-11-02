//
//  ContributorsTableViewCell.swift
//  RepositoryModule
//
//  Created by Mena Yousif on 11/1/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import UIKit
import Entities

protocol ContributorsTableViewCellDelegate: class {
    func contributorsTableViewCell(_ cell: ContributorsTableViewCell, didSelect contributor: Owner)
}

final class ContributorsTableViewCell: UITableViewCell {
    @IBOutlet weak private var contributorsCollectionView: UICollectionView!

    var contributors: [Owner] = [] {
        didSet {
            contributorsCollectionView.register(UINib(nibName: "ContributorCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ContributorCell")
            contributorsCollectionView.reloadData()
        }
    }

    weak var delegate: ContributorsTableViewCellDelegate?
    
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

extension ContributorsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.contributorsTableViewCell(self, didSelect: contributors[indexPath.row])
    }

}
