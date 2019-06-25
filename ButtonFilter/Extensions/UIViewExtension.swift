//
//  UIViewExtension.swift
//  ButtonFilter
//
//  Created by Thaliees on 6/25/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

extension UIView {
    // Create a func, this view is invisible, and it doesn't take any space for layout purposes.
    func gone(attribute: NSLayoutConstraint.Attribute = .height) -> Void {
        if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
            constraint.constant = 0.0
            self.layoutIfNeeded()
            self.isHidden = true
        }
    }
}
