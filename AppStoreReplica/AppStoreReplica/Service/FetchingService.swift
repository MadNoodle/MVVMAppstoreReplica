//
//  FetchingService.swift
//  AppStoreReplica
//
//  Created by Mathieu Janneau on 05/09/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

protocol fetchable {
  typealias Handler = ([Category]?, Error?) -> Void
  func fetchdata(handler: @escaping Handler )
}

class AppFetcher: fetchable {
 
  static let shared = AppFetcher()
  
  private init() {}
  
  func fetchdata(handler: @escaping Handler ){
    
    let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
    // prepare fetching remote data
    let session = URLSession.shared
    guard let url = URL(string: urlString) else { fatalError("error converting url")}
    session.dataTask(with: url) { (data, response, error) in
      
      // check for errors and sends error if needed
      if error != nil {
        handler(nil, error)
      }
      
      // Parsing data
      guard let data = data else { fatalError("There is no exploitable data")}
      
      let decoder = JSONDecoder()
      do {
        let results = try decoder.decode(Content.self, from: data)
        handler(results.categories, nil)
      } catch let error {
        print("error decoding Json")
         handler(nil, error)
      }
    }.resume()
    
  }
}
