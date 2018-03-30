//
//  ViewController.swift
//  Set
//
//  Created by eugene on 11/03/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    lazy var game = Set()
    
    
    func updateViewFromModel() {
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
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game = Set()
        var countUnhiddentCards = 0
        for button in buttons { 
            guard let indexOfButton = buttons.index(of: button) else {
                print("error")
                return
            }
            let card = game.cards.remove(at: indexOfButton)
            button.backgroundColor = UIColor.white
            renderCard(render: card, on: button)
            if (countUnhiddentCards < 12) {
                button.isHidden = false
            }
            countUnhiddentCards += 1
            button.layer.cornerRadius = 8.0
            game.cardsOnTable.append(card)
        }
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if(game.chosenCards.count < 3) {
            guard let indexOfChosenCard = buttons.index(of: sender) else {
                return
            }
            
            let card = game.cardsOnTable[indexOfChosenCard]
            
            if(game.chosenCards.contains(card)) {
                unSelectcard(select: sender)
                if let indexOfCardOnTable = game.chosenCards.index(of: card) {
                    game.chosenCards.remove(at: indexOfCardOnTable)
                }
            }
            else {
                game.chosenCards.append(card)
                seletCard(select: sender)
            }
        }
    }
    
    
    func seletCard(select button: UIButton) {
        button.layer.borderWidth = 3.0
        button.layer.borderColor = UIColor.blue.cgColor
    }
    
    
    func unSelectcard(select button: UIButton) {
        button.layer.borderWidth = 3.0
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    
}

