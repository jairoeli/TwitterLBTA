//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/25/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
  let user: User
  let message: String
  
  init(json: JSON) {
    let userJson = json["user"]
    self.user = User(json: userJson)
    self.message = json["message"].stringValue
  }
  
}
