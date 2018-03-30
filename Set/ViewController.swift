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
    let numbers:[Number] = [.One, .Two, .Three]
    let colors: [UIColor] = [.red, .green, .purple]
    let shapes: [Shape] = [.Square, .Sphere, .Triangle]
    let shadings: [Shading] = [.Striped, .Filled, .Outlined]
    
    func createAndShuffleDeck() {
        for number in numbers {
            for color in colors {
                for shape in shapes {
                    for shading in shadings {
                        deck.append(Card(put: shape, times: number, apply: shading, paint: color))
//                        deck.shuffle()
                    }
                }
            }
        }
        print("in deck: \(deck.count)")
        print("in outlet collection: \(buttons.count)")
    }
    
    func updateViewFromModel() {
        for button in buttons {
            let card = deck.remove(at: deck.count.arc4random())
            button.backgroundColor = UIColor.orange
            renderCard(render: card, on: button)
        }
    }
    
    func renderCard(render card: Card, on button: UIButton) {
        let label = String(repeating: card.shape.rawValue, count: card.number.rawValue)
        let attributes: [NSAttributedStringKey:Any]
        let foregroundColor: UIColor
        switch card.shading {
        case .Filled:
            foregroundColor = card.color.withAlphaComponent(CGFloat(1))
            attributes = [
                .strokeWidth : -1,
                .foregroundColor : foregroundColor
            ]
        case .Striped:
            foregroundColor = card.color.withAlphaComponent(CGFloat(0.15))
            attributes = [
                .strokeWidth : -1,
                .foregroundColor : foregroundColor
            ]
        case .Outlined:
            foregroundColor = card.color.withAlphaComponent(CGFloat(1))
            attributes = [
                .strokeWidth : 1,
                .foregroundColor : foregroundColor
            ]
        }
        let attributedString = NSAttributedString(string: label, attributes: attributes)
        button.setAttributedTitle(attributedString, for: UIControlState.normal)
    }
    
    @IBAction func start(_ sender: UIButton) {
        createAndShuffleDeck()
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
    }
    
    
}

