//
//  Categories.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 05/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct Category: Decodable {
  var name: String?
  var apps: [App]?
  var type: String?
  
  private enum CodingKeys: String, CodingKey {
    case name
    case apps = "apps"
    case type
  }
}
