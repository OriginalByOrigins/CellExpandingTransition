//
//  EP+configureViewsToState.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 18/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension ExpandingTransition {
  func configureViewsToState(_ state: TransitionState, width: CGFloat, height: CGFloat, targetFrame: CGRect, fullFrame: CGRect, foregroundView: UIView) {
    if state == .initial {
      topRegionSnapshot.frame = CGRect(x: 0, y: 0, width: width, height: targetFrame.minY)
      bottomRegionSnapshot.frame = CGRect(x: 0, y: targetFrame.maxY, width: width, height: height - targetFrame.maxY)
      
      targetContainer.frame = targetFrame
      targetSnapshot.alpha = 1
      foregroundView.alpha = 0
      navigationBarSnapshot.sizeToFit()
    } else if state == .final {
      topRegionSnapshot.frame = CGRect(x: 0, y: -targetFrame.minY, width: width, height: targetFrame.minY)
      bottomRegionSnapshot.frame = CGRect(x: 0, y: height, width: width, height: height - targetFrame.maxY)
      
      targetContainer.frame = fullFrame
      targetSnapshot.alpha = 0
      foregroundView.alpha = 1
    }
  }
}
