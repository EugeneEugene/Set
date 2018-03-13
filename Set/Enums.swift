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

extension UIColor {
    struct ColorForCards {
        static var red: UIColor  { return .red }
        static var green: UIColor { return .green }
        static var purple: UIColor { return .purple }
    }
}

extension Array {
    mutating func shuffle() -> Array<Element> {
        self = (GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self) as! Array<Element>)
        return self
    }
}


