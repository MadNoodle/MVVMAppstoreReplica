//
//  AppControllerViewModel.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 06/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct AppControllerViewModel {
  typealias Result = ([Category]?)-> Void
  func getData(result: @escaping Result) {
    let resultsFetcher = AppFetcher.shared
    resultsFetcher.fetchdata(handler: { (data, error) in
      if error != nil {
        print(error?.localizedDescription ?? "Error")
       result(nil)
      }
     result(data)
    })

  }
}
