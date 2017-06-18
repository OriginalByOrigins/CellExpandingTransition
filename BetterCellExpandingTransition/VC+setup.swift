//
//  VC+setup.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 17/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func setupCollectionView() {
    self.view.addSubview(collectionView)
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return colors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    cell.backgroundColor = colors[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 80)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedIndexPath = indexPath
    let secondVC = SecondViewController()
    self.present(secondVC, animated: true) {
      // maydo smth
    }
  }
}
