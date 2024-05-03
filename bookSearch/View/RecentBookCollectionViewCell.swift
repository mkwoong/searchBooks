//
//  RecentBookCollectionViewCell.swift
//  bookSearch
//
//  Created by 문기웅 on 5/3/24.
//

import UIKit

class RecentBookCollectionViewCell: UICollectionViewCell {
    static let cvcIdentifier = "RBCollectionViewCell"
    
    let bookImage: UIImage = UIImage()
    let bookNameLabel: UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
