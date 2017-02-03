//
//  HomeDatasourceController.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigationBarItems()
    
    collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
    
    fetchHomeFeed()
  }
  
  // MARK: - JSON
  
  let tron = TRON(baseURL: "http://api.letsbuildthatapp.com")
  
  fileprivate func fetchHomeFeed() {
    // start our json fetch
    let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
    
    request.perform(withSuccess: { (homeDatasource) in
      print("Successfully fetched our json objects")
      print(homeDatasource.users.count)
      
      self.datasource = homeDatasource
      
    }) { (err) in
      print("Failed to fetch json...", err)
    }
  }
  
  // MARK: - Collection View
  
  override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if let user = self.datasource?.item(indexPath) as? User {
      // let's get an estimation of the height of our cells based on user.bioText
      
      let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
      let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
      let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
      
      let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
      
      return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
    }
    
    return CGSize(width: view.frame.width, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  // MARK: - Footer & Header
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
    if section == 1 {
      return .zero
    }
    
    return CGSize(width: view.frame.height, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    
    if section == 1 {
      return .zero
    }
    
    return CGSize(width: view.frame.height, height: 64)
  }
  
  // MARK: - Transition
  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    collectionViewLayout.invalidateLayout()
  }
  
}
