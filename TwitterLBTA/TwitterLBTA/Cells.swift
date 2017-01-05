//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserCell: DatasourceCell {
  
  override var datasourceItem: Any? {
    didSet {
//      nameLabel.text = datasourceItem as? String
    }
  }
  
  // MARK: - Properties
  
  let nameLabel = UILabel {
    $0.text = "Jairo Eli de Leon"
    $0.font = UIFont.boldSystemFont(ofSize: 16)
  }
  
  let profileImageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "profile_image")
    $0.layer.cornerRadius = 5
    $0.clipsToBounds = true
  }
  
  let usernameLabel = UILabel {
    $0.text = "@jairoelid"
    $0.font = UIFont.systemFont(ofSize: 14)
    $0.textColor = UIColor(r: 130, g: 130, b: 130)
  }
  
  let bioTextView = UITextView {
    $0.text = "iOS engineer, originally from the land of the breakfast taco. @GallaudetU & @DevMtn alum. Spaghetti enthusiast."
    $0.font = UIFont.systemFont(ofSize: 15)
    $0.backgroundColor = .clear
  }
  
  let followButton = UIButton {
    $0.layer.cornerRadius = 5
    $0.layer.borderColor = twitterBlue.cgColor
    $0.layer.borderWidth = 1
    $0.setTitle("Follow", for: .normal)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    $0.setTitleColor(twitterBlue, for: .normal)
    $0.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
    $0.imageView?.contentMode = .scaleAspectFit
    $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
  }
  
  // MARK: - Set up
  override func setupViews() {
    super.setupViews()
    addSubview(profileImageView)
    addSubview(nameLabel)
    addSubview(usernameLabel)
    addSubview(bioTextView)
    addSubview(followButton)
    
    profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    
    nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
    
    usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    
    bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
    followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
  }
  
}

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




