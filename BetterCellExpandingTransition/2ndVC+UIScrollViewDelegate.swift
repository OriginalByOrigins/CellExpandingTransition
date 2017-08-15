//
//  2ndVC+UIScrollViewDelegate.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 18/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension SecondViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentOffsetY = scrollView.contentOffset.y
    
    if contentOffsetY > 0 {
      UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
        scrollView.contentOffset.y = 0
      }, completion: nil)
      
      return
    }
    
    UIView.animate(withDuration: 0.3) {
      self.setNeedsStatusBarAppearanceUpdate()
    }
    
    if !isBeingDismissed {
      navigationBarSnapshot?.frame = CGRect(x: 0, y: contentOffsetY, width: self.view.bounds.width, height: -contentOffsetY)
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if scrollView.contentOffset.y < -navigationBarHeight/2 {
      dismiss(animated: true, completion: nil)
    }
  }
}
