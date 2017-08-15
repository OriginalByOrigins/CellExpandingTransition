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
  
  let cellData = [
    ["image": #imageLiteral(resourceName: "yellow"), "title": "Yellow"],
    ["image": #imageLiteral(resourceName: "purple"), "title": "Purple"],
    ["image": #imageLiteral(resourceName: "blue"), "title": "Blue"],
    ["image": #imageLiteral(resourceName: "brown"), "title": "Brown"],
    ["image": #imageLiteral(resourceName: "green"), "title": "Green"]
  ]
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 64), collectionViewLayout: layout)
    collectionView.backgroundColor =  UIColor(red: 38/255, green: 50/255, blue: 56/255, alpha: 1)
    collectionView.delegate = self
    collectionView.dataSource = self
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    navigationItem.title = "Transition"
    navigationController?.navigationBar.barTintColor = UIColor(red: 96/255, green: 125/255, blue: 139/255, alpha: 1)
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
    
    setupCollectionView()
  }
}

