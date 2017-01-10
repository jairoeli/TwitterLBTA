//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserHeader: DatasourceCell {
  
  // MARK: - Property
  let textLabel = UILabel {
    $0.text = "WHO TO FOLLOW"
    $0.font = UIFont.systemFont(ofSize: 16)
  }
  // MARK: - Set up
  override func setupViews() {
    super.setupViews()
    addSubview(textLabel)
    
    separatorLineView.isHidden = false
    separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    
    textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
  }
}

class UserFooter: DatasourceCell {
  
  // MARK: - Property
  let textLabel = UILabel {
    $0.text = "Show me more"
    $0.font = UIFont.systemFont(ofSize: 15)
    $0.textColor = twitterBlue
  }
  
  // MARK: - Set up
  override func setupViews() {
    super.setupViews()
    
    addSubview(textLabel)
    textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
  }
}
