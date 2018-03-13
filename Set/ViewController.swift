//
//  ViewController.swift
//  Set
//
//  Created by eugene on 11/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = [Card]()
    
    @IBOutlet var buttons: [UIButton]!
    var numbers:[Number] = [.One, .Two, .Three]
    var colors = [UIColor.ColorForCards.red, UIColor.ColorForCards.green, UIColor.ColorForCards.purple]
    var shapes: [Shape] = [.Square, .Sphere, .Triangle]
    var shadings: [Shading] = [.Striped, .Filled, .Outlined]
    
    func createAndShuffleDeck() {
        for number in numbers {
            for color in colors {
                for shape in shapes {
                    for shading in shadings {
                        deck.append(Card(put: shape, times: number, apply: shading, paint: color))
                        deck.shuffle()
                    }
                }
            }
        }
        print("in deck: \(deck.count)")
        print("in outlet collection: \(buttons.count)")
    }
    
    @IBAction func start(_ sender: UIButton) {
        createAndShuffleDeck()
    }
    
    
    
}

