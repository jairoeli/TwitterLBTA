//
//  Extension.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 12/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

protocol Dao {}
extension NSObject: Dao {}

extension Dao where Self: NSObject {
  
  init(closure: (Self) -> Void) {
    self.init()
    closure(self)
  }
  
}

extension Dao where Self: UIButton {
  
  init(type: UIButtonType, closure: (Self) -> Void) {
    self = UIButton(type: type) as! Self
    closure(self)
  }
  
}
