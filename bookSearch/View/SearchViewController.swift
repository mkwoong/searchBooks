//
//  SearchViewController.swift
//  bookSearch
//
//  Created by 문기웅 on 5/3/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    let tabBarLabel: UILabel = UILabel()
    let bookSearchBar: UISearchBar = UISearchBar()
    let cvLabel: UILabel = UILabel()
    let flowLayout = UICollectionViewFlowLayout()
    lazy var recentBookCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    let tvLabel: UILabel = UILabel()
    let searchResultTableView: UITableView = UITableView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        addConstraints()
        configure()
        
    }
    
    func addConstraints() {
        [tabBarLabel, bookSearchBar, cvLabel, recentBookCollectionView, tvLabel, searchResultTableView].forEach{ view.addSubview($0) }
        
        self.navigationItem.titleView = tabBarLabel
        
        
//        self.navigationItem.titleView = bookSearchBar
        bookSearchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cvLabel.snp.makeConstraints { make in
            make.top.equalTo(bookSearchBar.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
        }
        
        recentBookCollectionView.snp.makeConstraints { make in
            make.top.equalTo(cvLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout =  UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.itemSize = .init(width: 50, height: 50)
            return layout
        }()
        
        tvLabel.snp.makeConstraints { make in
            make.top.equalTo(recentBookCollectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
        }
    }
    
    func configure() {
        bookSearchBar.backgroundColor = .lightText
        
        recentBookCollectionView.backgroundColor = .lightText
        recentBookCollectionView.dataSource = self
        recentBookCollectionView.delegate = self
        recentBookCollectionView.register(RecentBookCollectionViewCell.self, forCellWithReuseIdentifier: RecentBookCollectionViewCell.rbIdentifier)
        
        tabBarLabel.text = "Find My Book"
        tabBarLabel.textColor = .white
        
        cvLabel.text = "최근 본 책"
        cvLabel.textColor = .white
        tvLabel.text = "검색 결과"
        tvLabel.textColor = .white
    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentBookCollectionViewCell.rbIdentifier, for: indexPath) as? RecentBookCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    
}

