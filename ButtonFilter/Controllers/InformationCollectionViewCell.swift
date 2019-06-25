//
//  InformationCollectionViewCell.swift
//  ButtonFilter
//
//  Created by Thaliees on 6/25/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards

class InformationCollectionViewCell: MDCCardCollectionCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descrip: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization codes
        // Initialize card
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = CGFloat(10)
    }
}
