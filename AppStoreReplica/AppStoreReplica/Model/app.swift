//
//  app.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 05/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct App: Decodable {
  var id: Int?
  var name: String?
  var category: String?
  var price: Double?
  var imageName: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "Id"
    case name = "Name"
    case category = "Category"
    case price = "Price"
    case imageName = "ImageName"
  }
}

