//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
  
  let profileImageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "profile_image")
    $0.layer.cornerRadius = 5
    $0.clipsToBounds = true
  }
  
  override func setupViews() {
    super.setupViews()
    addSubview(profileImageView)
    
    separatorLineView.isHidden = false
    separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    
    profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    
    backgroundColor = .white
  }
  
}
