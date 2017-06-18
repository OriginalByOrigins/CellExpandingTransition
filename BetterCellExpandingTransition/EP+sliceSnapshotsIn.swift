//
//  EP+sliceSnapshotsIn.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension ExpandingTransition {
  func sliceSnapshotsIn(_ backgroundViewController: UIViewController, targetFrame: CGRect, targetView: UIView) {
    guard let view = backgroundViewController.view else { return }
    
    // create top and bottom region snapshots
    topRegionSnapshot = view.resizableSnapshotView(from: CGRect(x: 0, y: 0, width: view.frame.width, height: targetFrame.minY), afterScreenUpdates: true, withCapInsets: .zero)
    bottomRegionSnapshot = view.resizableSnapshotView(from: CGRect(x: 0, y: targetFrame.maxY, width: view.frame.width, height: view.frame.height - targetFrame.maxY), afterScreenUpdates: true, withCapInsets: .zero)
    
    // create tart view snapshot
    targetSnapshot = targetView.snapshotView(afterScreenUpdates: true)
    
    targetContainer = UIView(frame: targetFrame)
    targetContainer.backgroundColor = .white
    targetContainer.clipsToBounds = true
    targetContainer.addSubview(targetSnapshot)
    
    // create navbar snapshot
    guard let navController = backgroundViewController as? UINavigationController else { return }
    let barHeight = navController.navigationBar.frame.maxY
    
    UIGraphicsBeginImageContext(CGSize(width: view.frame.width, height: barHeight))
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
    let navigationBarImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    navigationBarSnapshot = UIImageView(image: navigationBarImage)
    navigationBarSnapshot.backgroundColor = navController.navigationBar.barTintColor
    navigationBarSnapshot.contentMode = .bottom
  }
}
