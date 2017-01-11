//
//  HomeDatasourceController.swift
//  TwitterLBTA
//
//  Created by Jairo Eli de Leon on 1/1/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let homeDatasource = HomeDatasource()
    self.datasource = homeDatasource
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.height, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.height, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}
