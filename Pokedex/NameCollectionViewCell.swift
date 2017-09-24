//
//  NameCollectionViewCell.swift
//  Pokedex
//
//  Created by Srujay Korlakunta on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class NameCollectionViewCell: UICollectionViewCell {
    
    var fruitImage: UIImageView!
    var myLabel: UILabel!
    
    override func awakeFromNib() {
        fruitImage = UIImageView(frame: CGRect(x: contentView.frame.width * 0.15, y: contentView.frame.height * 0.15, width: contentView.frame.width * 0.7, height: contentView.frame.height * 0.7))
        fruitImage.contentMode = .scaleAspectFit
        contentView.addSubview(fruitImage)
        
        myLabel = UILabel(frame: CGRect(x: contentView.frame.width * 0.2, y: contentView.frame.height * 0.45, width: contentView.frame.width * 0.7, height: contentView.frame.height * 0.7))
        myLabel.textColor = .red
        contentView.addSubview(myLabel)
    }
    
}
