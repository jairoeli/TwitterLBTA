//
//  Service.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 2/6/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
  
  let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
  
  static let sharedInstance = Service()
  private init() {} //This prevents others from using the default '()' initializer for this struct.
  
  func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
    print("Fetching home feed")
    
    let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
    
    request.perform(withSuccess: { (homeDatasource) in
      print("Successfully fetched our json objects")
      completion(homeDatasource)
    }) { (err) in
      print("Failed to fetch json...", err)
    }
    
  }
  
}
