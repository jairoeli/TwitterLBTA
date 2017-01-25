//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
  
  let users: [User] = {
    let jairoUser = User(name: "Jairo Eli de León", username: "@jairoelid", bioText: "iOS engineer, originally from the land of the breakfast taco. @GallaudetU & @DevMtn alum. Spaghetti enthusiast.", profileImage: #imageLiteral(resourceName: "profile_image"))
    
    let pWUser = User(name: "Grace Hopper", username: "@CodeWisdom", bioText: "Computer programming wisdom and quotes from throughout the years.", profileImage: #imageLiteral(resourceName: "grace_hopper"))
    
    let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "This recently released course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView. This course also teaches some basics on the Swift language, for example If Statements and For Loops. This will be an excellent purchase for you.", profileImage: #imageLiteral(resourceName: "brainVoong"))
    
    return [jairoUser, pWUser, kindleCourseUser]
  }()
  
  let tweets: [Tweet] = {
    let jairoUser = User(name: "Jairo Eli de León", username: "@jairoelid", bioText: "iOS engineer, originally from the land of the breakfast taco. @GallaudetU & @DevMtn alum. Spaghetti enthusiast.", profileImage: #imageLiteral(resourceName: "profile_image"))
    
    let tweet = Tweet(user: jairoUser, message: "Passion is the only resource you can afford. It helps you to realize your dream because it forces you to keep that dream real. #PowerOfBroke")
    let tweet2 = Tweet(user: jairoUser, message: "To me, programming is more than an important practical art. It is also a gigantic undertaking in the foundations of knowledge. - Grace Hopper")
    
    return [tweet, tweet2]
  }()
  
  // MARK: - Register classes
  override func footerClasses() -> [DatasourceCell.Type]? {
    return [UserFooter.self]
  }
  
  override func headerClasses() -> [DatasourceCell.Type]? {
    return [UserHeader.self]
  }
  
  override func cellClasses() -> [DatasourceCell.Type] {
    return [UserCell.self, TweetCell.self]
  }
  
  // MARK: - Data source
  
  override func item(_ indexPath: IndexPath) -> Any? {
    if indexPath.section == 1 {
      return tweets[indexPath.item]
    }
    return users[indexPath.item]
  }
  
  override func numberOfItems(_ section: Int) -> Int {
    if section == 1 {
      return tweets.count
    }
    
    return users.count
  }
  
  override func numberOfSections() -> Int {
    return 2
  }
  
}
