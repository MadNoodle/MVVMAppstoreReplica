//
//  AppCell.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 06/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {

  @IBOutlet weak var thumbnailImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(with datasource: Category, at index: Int) {
    titleLabel.text = datasource.apps?[index].name ?? ""
    categoryLabel.text = datasource.apps?[index].category ?? ""
    if datasource.apps?[index].price != nil {priceLabel.text = String(format: "%.2f €", (datasource.apps?[index].price)!)} else  { priceLabel.text = ""}
    
    // Image set up
    if let _name =  datasource.apps?[index].imageName{
    thumbnailImage.image = UIImage(named:_name)}
    thumbnailImage.layer.cornerRadius = 16.0
    thumbnailImage.layer.masksToBounds = true

  }
  
}
