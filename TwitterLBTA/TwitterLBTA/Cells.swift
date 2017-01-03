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
//      nameLabel.text = datasourceItem as? String
    }
  }
  
  let nameLabel = UILabel {
    $0.text = "TEST TEST TEST"
    $0.backgroundColor = .green
  }
  
  let profileImageView = UIImageView {
    $0.backgroundColor = .red
  }
  
  let usernameLabel = UILabel {
    $0.text = "username"
    $0.backgroundColor = .purple
  }
  
  let bioTextView = UITextView {
    $0.backgroundColor = .yellow
  }
  
  let followButton = UIButton {
    $0.backgroundColor = .cyan
  }
  
  override func setupViews() {
    super.setupViews()
    addSubview(profileImageView)
    addSubview(nameLabel)
    addSubview(usernameLabel)
    addSubview(bioTextView)
    addSubview(followButton)
    
    profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    
    nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
    
    usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    
    bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
    followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
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
