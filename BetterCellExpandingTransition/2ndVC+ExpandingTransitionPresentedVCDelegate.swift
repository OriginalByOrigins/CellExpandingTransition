//
//  2ndVC+ExpandingTransitionPresentedVCDelegate.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 18/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension SecondViewController: ExpandingTransitionPresentedVCDelegate {
  func expandingTransition(_ transition: ExpandingTransition, navigationBarSnapshot: UIView) {
    self.navigationBarSnapshot = navigationBarSnapshot
    self.navigationBarHeight = navigationBarSnapshot.frame.height
  }
}
