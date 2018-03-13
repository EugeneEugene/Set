//
//  Card.swift
//  Set
//
//  Created by eugene on 13/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

struct Card {
    var color: UIColor
    var shape: Shape
    var number: Number
    var shading: Shading
    var isMatched = false
    var isSelected = false
    
    init(put shape: Shape, times number: Number, apply shading: Shading, paint color: UIColor) {
        self.shape = shape
        self.number = number
        self.shading = shading
        self.color = color
    }
}