//
//  ViewController.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 04/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class AppController: UIViewController {
  
  // MARK: - PROPERTIES
  
  let categoryId = "catId"
  var viewModel: AppControllerViewModel!
  var dataSource: [Category] = []
  // MARK: - OUTLETS
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "AppStore"
    viewModel = AppControllerViewModel()
    configureCollectionView()
  }
  
  func configureCollectionView() {
    //Configure UI
    collectionView.dataSource = self
    let nib = UINib(nibName: "CategoryCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: categoryId)
    
    //loadData
    self.viewModel.getData{[weak self] (categories) in
      self?.dataSource = categories!
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
      }
      
    }
    
  }
}

extension AppController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryId, for: indexPath) as? CategoryCell else { fatalError("BAD CELL")}
   cell.configureCell(with: dataSource, at: indexPath.row)
    return cell
  }
  
}

extension AppController : UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 220)
  }
}


