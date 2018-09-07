//
//  Content.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 05/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct Content: Decodable {
  var categories: [Category]?
  
  private enum CodingKeys: String, CodingKey {
    
    case categories = "categories"
  }
}
