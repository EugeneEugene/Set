//
//  Set.swift
//  Set
//
//  Created by eugene on 13/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

struct Set {
    
    var matchedCards = [Card]()
    var cards = [Card]()
    var cardsOnTable = [Card]()
    var chosenCards = [Card]()
    
    let numbers:[Number] = [.One, .Two, .Three]
    let colors: [UIColor] = [.red, .green, .purple]
    let shapes: [Shape] = [.Square, .Sphere, .Triangle]
    let shadings: [Shading] = [.Striped, .Filled, .Outlined]
    
    
    init() {
        for number in numbers {
            for color in colors {
                for shape in shapes {
                    for shading in shadings {
                        cards.append(Card(put: shape, times: number, apply: shading, paint: color))                    }
                }
            }
        }
        
        cards.shuffle()
        print("in deck: \(cards.count)")
        print("in outlet collection: \(cards.count)")
    }
    
}
