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
    
    lazy var game = Set()
    
    func updateViewFromModel() {
        for button in buttons {
            let card = game.cards.remove(at: deck.count.arc4random())
            button.backgroundColor = UIColor.white
            renderCard(render: card, on: button)
            button.isHidden = false
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
                .strokeWidth : 6,
                .foregroundColor : foregroundColor
            ]
        }
        let attributedString = NSAttributedString(string: label, attributes: attributes)
        button.setAttributedTitle(attributedString, for: UIControlState.normal)
    }
    
    @IBAction func start(_ sender: UIButton) {
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
    }
    
    
}

