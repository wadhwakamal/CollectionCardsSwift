//
//  CardCollectionViewCell.swift
//  CollectionCards
//
//  Created by Kamal Wadhwa on 29/12/17.
//  Copyright © 2017 Kamal Wadhwa. All rights reserved.
//

import UIKit

class CardCollectionViewCell: BaseCollectionCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        containerView.layer.cornerRadius = 9
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 5)  //Here you control x and y
        containerView.layer.shadowOpacity = 0.15
        containerView.layer.shadowRadius = 4.0 //Here your control your blur
        containerView.layer.masksToBounds =  false
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 9).cgPath
    }
}
