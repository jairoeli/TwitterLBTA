//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
  
  // MARK: - Properties
  
  let users: [User]
  let tweets: [Tweet]
  
  // MARK: - JSON
  required init(json: JSON) throws {
    guard let usersJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
      throw NSError(domain: "com.jairoeli.TwitterLBTA", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid."])
    }
    
    self.users = usersJsonArray.map { User(json: $0) }
    self.tweets = tweetsJsonArray.map { Tweet(json: $0) }
  }
  
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
