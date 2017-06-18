//
//  ExpandingTransition.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class ExpandingTransition: NSObject, UIViewControllerAnimatedTransitioning {
  enum TransitionMode {
    case present, dismiss
  }
  var transitionMode: TransitionMode!
  
  var presentDuration = 1.0
  var dismissDuration = 1.0
  
  var presentingViewController: UIViewController!
  var presentedViewController: UIViewController!
  
  var targetSnapshot: UIView!
  var targetContainer: UIView!
  var topRegionSnapshot: UIView!
  var bottomRegionSnapshot: UIView!
  var navigationBarSnapshot: UIView!
  
  enum TransitionState {
    case initial, final
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return transitionMode == .present ? presentDuration : dismissDuration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let duration = transitionDuration(using: transitionContext)
    
    guard
      let fromViewController = transitionContext.viewController(forKey: .from),
      let toViewController = transitionContext.viewController(forKey: .to)
    else { return }
    
    // determine foreground and background VC
    var foregroundViewController = toViewController
    var backgroundViewController = fromViewController
    if transitionMode == .dismiss {
      foregroundViewController = fromViewController
      backgroundViewController = toViewController
    }
    
    // get target view from backgroundVC
    var targetViewController = backgroundViewController
    if let navController = targetViewController as? UINavigationController {
      targetViewController = navController.topViewController!
    }
    guard let targetView = (targetViewController as? ExpandingTransitionPresentingVCDelegate)?.expandingTransitionTargetViewFor(transition: self) else { return }
    
    // setup animation
    let targetFrame = backgroundViewController.view.convert(targetView.frame, from: targetView.superview)
    if transitionMode == .present {
      sliceSnapshotsIn(backgroundViewController, targetFrame: targetFrame, targetView: targetView)
      (foregroundViewController as? ExpandingTransitionPresentedVCDelegate)?.expandingTransition(self, navigationBarSnapshot: navigationBarSnapshot)
    } else {
      self.navigationBarSnapshot.frame = containerView.convert(navigationBarSnapshot.frame, from: navigationBarSnapshot.superview)
    }
    
//    targetContainer.addSubview(foregroundViewController.view)
    containerView.addSubview(targetContainer)
    containerView.addSubview(topRegionSnapshot)
    containerView.addSubview(bottomRegionSnapshot)
    containerView.addSubview(navigationBarSnapshot)
    targetContainer.addSubview(foregroundViewController.view)
    
    let width = backgroundViewController.view.bounds.width
    let height = backgroundViewController.view.bounds.height
    
    let preTransition: TransitionState = transitionMode == .present ? .initial : .final
    let postTransition: TransitionState = transitionMode == .present ? .final : .initial
    
    configureViewsToState(preTransition, width: width, height: height, targetFrame: targetFrame, fullFrame: foregroundViewController.view.frame, foregroundView: foregroundViewController.view)
    
    //perform animation
    backgroundViewController.view.isHidden = true
    UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
      self.configureViewsToState(postTransition, width: width, height: height, targetFrame: targetFrame, fullFrame: foregroundViewController.view.frame, foregroundView: foregroundViewController.view)
      
      if self.transitionMode == .present {
        self.navigationBarSnapshot.frame.size.height = 0
      }
    }) { (completed) in
      self.targetContainer.removeFromSuperview()
      self.topRegionSnapshot.removeFromSuperview()
      self.bottomRegionSnapshot.removeFromSuperview()
      self.navigationBarSnapshot.removeFromSuperview()
      
      containerView.addSubview(foregroundViewController.view)
      backgroundViewController.view.isHidden = false
      
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
  }
  
}
