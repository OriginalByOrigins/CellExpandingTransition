//
//  Protocol.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

// With the presenting view controller, our transition object needs to know about the cell being tapped on. It needs this because it affects the snapshots are sliced up (tapping the first cell generates different snapshots when compared to tapping, say, the third cell.)
protocol ExpandingTransitionPresentingVCDelegate {
  func expandingTransitionTargetViewFor(transition: ExpandingTransition) -> UIView
}

// With the presented view controller, our transition object has needs to pass over the snapshot of the navigation bar for the dismissal effect.
protocol ExpandingTransitionPresentedVCDelegate {
  func expandingTransition(_ transition: ExpandingTransition, navigationBarSnapshot: UIView)
}
