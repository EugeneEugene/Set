//
//  Enums.swift
//  Set
//
//  Created by eugene on 13/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit
import GameplayKit

enum Shading {
    case Striped, Filled, Outlined
}

enum Number: Int {
    case One = 1, Two, Three
}

enum Shape: String {
    case Sphere = "●", Square = "■", Triangle = "▲"
}

extension Array {
    mutating func shuffle() {
        self = (GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self) as! Array<Element>)
    }
}

extension Int {
    func arc4random() -> Int {
        return  Int(arc4random_uniform(UInt32(self)))
    }
}


