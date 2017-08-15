//
//  VC+ExpandingTransitionPresentingVCDelegate.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension ViewController: ExpandingTransitionPresentingVCDelegate {
  func expandingTransitionTargetViewFor(transition: ExpandingTransition) -> UIView {
    guard
      let selectedIndexPath = selectedIndexPath,
      let selectedCell = collectionView.cellForItem(at: selectedIndexPath)
    else { return UIView()}
    
    return selectedCell
  }
}
