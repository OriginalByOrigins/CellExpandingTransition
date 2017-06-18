//
//  EP+transitioningDelegate.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension ExpandingTransition: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    if let navController = presenting as? UINavigationController {
      presentingViewController = navController.topViewController
    }
    
    if presentingViewController is ExpandingTransitionPresentingVCDelegate {
      transitionMode = .present
      return self
    }
    
    return nil
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    if presentingViewController is ExpandingTransitionPresentingVCDelegate {
      transitionMode = .dismiss
      return self
    }
    
    return nil
  }
}
