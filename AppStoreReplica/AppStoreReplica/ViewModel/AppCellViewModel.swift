//
//  AppCellViewModel.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 06/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation
import UIKit

protocol AppPresentable {
  var id: Int { get set}
  var name: String { get set}
  var category: String { get set}
  var price: String { get set}
  var image: UIImage? { get set}
}

struct AppCellViewModel {
  let app: App
  
  var id: Int {
    return app.id!
  }
  var name: String {
    return app.name!
  }
  var category: String {
    return app.category!
  }
  var price: String {
    return String(format:"%.2f", app.price!)
  }
  var image: UIImage? {
    var _image: UIImage?
    if let imageName = app.imageName {
          do {
            let url = URL(string:"https://api.letsbuildthatapp.com/appstore/featured/\(imageName)")
            let data = try Data(contentsOf: url!)
            _image = UIImage(data: data)!
          }
          catch{
            print(error)
            _image =  nil
          }
  }
    return _image
}
}

//
//    }
//  }
////}
