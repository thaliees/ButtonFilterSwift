//
//  InformationModel.swift
//  ButtonFilter
//
//  Created by Thaliees on 6/25/19.
//  Copyright © 2019 Thaliees. All rights reserved.
//

import UIKit

struct InformationModel {
    var title:String
    var date:String
    var description:String
    var image:String
    var tag:String
    
    init(title:String, date:String, image:String, description:String, tag:String) {
        self.title = title
        self.date = date
        self.description = description
        self.image = image
        self.tag = tag
    }
}
