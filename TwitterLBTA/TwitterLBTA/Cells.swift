//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
  
  override var datasourceItem: Any? {
    didSet {
      nameLabel.text = datasourceItem as? String
    }
  }
  
  let nameLabel = UILabel {
    $0.text = "TEST TEST TEST"
  }
  
  override func setupViews() {
    super.setupViews()
    backgroundColor = .yellow
    addSubview(nameLabel)
    
    nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
  }
  
}

class UserHeader: DatasourceCell {
  
  override func setupViews() {
    super.setupViews()
    backgroundColor = .blue
  }
}

class UserFooter: DatasourceCell {
  
  override func setupViews() {
    super.setupViews()
    backgroundColor = .green
  }
}
