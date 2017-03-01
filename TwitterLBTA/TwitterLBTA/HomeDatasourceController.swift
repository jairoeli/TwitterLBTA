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
  
  let errorMessageLabel = UILabel {
    $0.text = "Apologies something went wrong. Please try again later..."
    $0.textAlignment = .center
    $0.numberOfLines = 0
    $0.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(errorMessageLabel)
    errorMessageLabel.fillSuperview() // LBTA method call
    
    setupNavigationBarItems()
    
    collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
    
    Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
      if let err = err {
        
        if let apiError = err as? APIError<JSONError> {
          if apiError.response?.statusCode != 200 {
            self.errorMessageLabel.text = "Status code was not 200"
          }
        }
        
        self.errorMessageLabel.isHidden = false
        return
      }
      self.datasource = homeDataSource
    }
    
  }
  
  private func estimatedHeightForText(_ text: String) -> CGFloat {
    let approximateWidthOfTextView = view.frame.width - 12 - 50 - 12 - 2
    let size = CGSize(width: approximateWidthOfTextView, height: 1000)
    let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
    let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
    return estimatedFrame.height
  }
  
  // MARK: - Collection View
  
  override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    //first section of users
    if indexPath.section == 0 {
      guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
      let estimatedHeight = estimatedHeightForText(user.bioText)
      return CGSize(width: view.frame.width, height: estimatedHeight + 66)
      
    } else if indexPath.section == 1 {
      // our tweets size estimation
      guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
      let estimatedHeight = estimatedHeightForText(tweet.message)
      return CGSize(width: view.frame.width, height: estimatedHeight + 74)
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
