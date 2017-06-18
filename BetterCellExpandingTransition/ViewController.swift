//
//  ViewController.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var selectedIndexPath: IndexPath?
  
  let cellId = "cellId"
  
  let colors = [
    UIColor(red: 255/255, green: 183/255, blue: 77/255, alpha: 1),
    UIColor(red: 116/255, green: 78/255, blue: 178/255, alpha: 1),
    UIColor(red: 126/255, green: 204/255, blue: 296/255, alpha: 1),
    UIColor(red: 141/255, green: 110/255, blue: 99/255, alpha: 1),
    UIColor(red: 38/255, green: 193/255, blue: 134/255, alpha: 1)
  ]
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height-100), collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = .white
    
    navigationItem.title = "Transition"
    navigationController?.navigationBar.barTintColor = UIColor(red: 96/255, green: 125/255, blue: 139/255, alpha: 1)
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
    
    setupCollectionView()
  }
}

