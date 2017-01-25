//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/18/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
  
  override var datasourceItem: Any? {
    didSet {
      guard let tweet = datasourceItem as? Tweet else { return }
      
      let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
      
      let usernameString = "  \(tweet.user.username)\n"
      
      attributedText.append(NSMutableAttributedString(string: usernameString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
      
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = 4
      
      let range = NSMakeRange(0, attributedText.string.characters.count)
      attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
      
      attributedText.append(NSMutableAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
      
      messageTextView.attributedText = attributedText
    }
  }
  
  let messageTextView = UITextView {
    $0.text = "SOME SAMPLE TEXT"
  }
  
  let profileImageView = UIImageView {
    $0.image = #imageLiteral(resourceName: "profile_image")
    $0.layer.cornerRadius = 5
    $0.clipsToBounds = true
  }
  
  override func setupViews() {
    super.setupViews()
    
    separatorLineView.isHidden = false
    separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    backgroundColor = .white
    
    addSubview(profileImageView)
    addSubview(messageTextView)
    
    profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    
    messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    
  }
  
}
