//
//  CardDeck.swift
//  Set
//
//  Created by eugene on 23/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import Foundation

struct CardDeck {
    var deck = [Card]()
    
    init() {
        for shape in Card.Shape.all {
            for count in Card.Number.all {
                for color in Card.Color.all {
                    for shading in Card.Shading.all {
                        deck.append(Card(put: shape, times: count, apply: shading, paint: color))
                    }
                }
            }
        }
    }
    
}
