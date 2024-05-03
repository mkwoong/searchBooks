//
//  SearchResultTableViewCell.swift
//  bookSearch
//
//  Created by 문기웅 on 5/3/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    static let tvcIdentifier = "SRTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SearchResultTableViewCell.tvcIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
