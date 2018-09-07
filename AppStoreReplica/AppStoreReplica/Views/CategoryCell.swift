//
//  CategoryCell.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 04/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit


class CategoryCell: UICollectionViewCell {

  // MARK: - PROPERTIES
  let reuseId = "appCell"
  
  var _datasource: Category?
  
  // MARK: - OUTLETS
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var appCollectionView: UICollectionView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    }

  // MARK: -
  func configureCell(with datasource: [Category], at index: Int){
   
    let nib = UINib(nibName: "AppCell", bundle: nil)
    appCollectionView.dataSource = self
    appCollectionView.delegate = self
    appCollectionView.register(nib, forCellWithReuseIdentifier: reuseId)
    _datasource = datasource[index]
    if let title = datasource[index].name{
    titleLabel.text = title
    }
  }
}

extension CategoryCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let appCount = _datasource?.apps?.count else { return 0}
    return appCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = appCollectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? AppCell else { fatalError("loading cell error")}
    
    cell.configureCell(with: _datasource!, at: indexPath.row)
    return cell
  }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: 100, height: collectionView.frame.height)
  }
}
