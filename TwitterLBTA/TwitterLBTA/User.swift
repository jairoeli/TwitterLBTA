//
//  User.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/9/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
  let name: String
  let username: String
  let bioText: String
  let profileImageURL: String
  
  init(json: JSON) {
    self.name = json["name"].stringValue
    self.username = json["username"].stringValue
    self.bioText = json["bio"].stringValue
    self.profileImageURL = json["profileImageUrl"].stringValue
  }
  
}
