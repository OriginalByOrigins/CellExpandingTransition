//
//  SecondViewController.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  let transition = ExpandingTransition()
  
  var navigationBarSnapshot: UIView?
  var navigationBarHeight: CGFloat = 0
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.frame = self.view.frame
    scrollView.contentInsetAdjustmentBehavior = .never
    scrollView.showsVerticalScrollIndicator = false
    scrollView.delegate = self
    return scrollView
  }()
  
  lazy var bgImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "bg")
    imageView.contentMode = .scaleAspectFill
    imageView.frame = self.scrollView.frame
    return imageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.transitioningDelegate = transition

    self.view.addSubview(scrollView)
    scrollView.addSubview(bgImageView)
    scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height*2)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if let navigationBarSnapshot = navigationBarSnapshot {
      navigationBarSnapshot.frame.origin.y = -navigationBarHeight
      scrollView.addSubview(navigationBarSnapshot)
    }
  }
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    if scrollView.contentOffset.y < -navigationBarHeight/2 {
      return .lightContent
    }
    return .default
  }
}
