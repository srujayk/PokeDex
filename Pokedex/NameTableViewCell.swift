//
//  NameTableViewCell.swift
//  Pokedex
//
//  Created by Srujay Korlakunta on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    var nameLabel: UILabel!   //Our Name Label
    
    var cellImg : UIImageView = UIImageView(frame: CGRect(x:0,y:0,width:50.0,height:50.0)) //ADD THIS
    
    //When do you think this is called?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Our Name Label
        nameLabel = UILabel(frame: CGRect(x: 60, y: contentView.frame.height * (1/4), width: 150, height: contentView.frame.height * (1/2)))
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        
        contentView.addSubview(cellImg) //ADD THIS
        
        
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
