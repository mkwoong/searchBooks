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
        
        searchResultTableView.snp.makeConstraints { make in
            make.top.equalTo(tvLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            searchResultTableView.rowHeight = 100
        }
        
        
        
        
    }
    
    func configure() {
        bookSearchBar.backgroundColor = .lightText
        
        // 탭바 label
        tabBarLabel.text = "Find My Book"
        tabBarLabel.textColor = .white
        
        // 컬렉션 뷰 label
        cvLabel.text = "최근 본 책"
        cvLabel.textColor = .white
        
        // 컬렉션 뷰
        recentBookCollectionView.backgroundColor = .lightText
        recentBookCollectionView.dataSource = self
        recentBookCollectionView.delegate = self
        recentBookCollectionView.register(RecentBookCollectionViewCell.self, forCellWithReuseIdentifier: RecentBookCollectionViewCell.cvcIdentifier)
        
        // 테이블 뷰 label
        tvLabel.text = "검색 결과"
        tvLabel.textColor = .white
        
        // 테이블 뷰
        searchResultTableView.dataSource = self
        searchResultTableView.delegate = self
        searchResultTableView.backgroundColor = .lightText
        searchResultTableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.tvcIdentifier)
        
    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentBookCollectionViewCell.cvcIdentifier, for: indexPath) as? RecentBookCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.tvcIdentifier, for: indexPath) as? SearchResultTableViewCell else {return UITableViewCell()}
        
        
        return cell
    }
    
    
}
