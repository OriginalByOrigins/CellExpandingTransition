//
//  CollectionViewCell.swift
//  BetterCellExpandingTransition
//
//  Created by Harry Cao on 18/6/17.
//  Copyright © 2017 HarryCodes. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let cardVisualEffectView: UIVisualEffectView = {
    let blurEffect = UIBlurEffect(style: .dark)
    let view = UIVisualEffectView(effect: blurEffect)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 35)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(imageView)
    imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    
    self.addSubview(cardVisualEffectView)
    cardVisualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    cardVisualEffectView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    cardVisualEffectView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    cardVisualEffectView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    
    cardVisualEffectView.contentView.addSubview(label)
    label.topAnchor.constraint(equalTo: cardVisualEffectView.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: cardVisualEffectView.bottomAnchor).isActive = true
    label.leftAnchor.constraint(equalTo: cardVisualEffectView.leftAnchor).isActive = true
    label.rightAnchor.constraint(equalTo: cardVisualEffectView.rightAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
