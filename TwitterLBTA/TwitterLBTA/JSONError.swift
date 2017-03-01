//
//  JSONError.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 2/2/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//
 
import Foundation
import TRON
import SwiftyJSON

class JSONError: JSONDecodable {
  
  required init(json: JSON) throws {
    print("JSON ERROR")
  }
  
}
