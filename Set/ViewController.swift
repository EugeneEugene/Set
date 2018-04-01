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
  lazy var game = SetModel()
  var chosenButtons = [UIButton]()
  
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
    chosenButtons = [UIButton]()
    game = SetModel()
    var countUnhiddentCards = 0
    for button in buttons {
      guard let indexOfButton = buttons.index(of: button) else {
        print("error")
        return
      }
      let card = game.cards.remove(at: indexOfButton)
      button.backgroundColor = UIColor.white
      button.layer.borderWidth = 0
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
    guard let buttonIndex = buttons.index(of: sender) else{
      print("No button on the screen")
      return
    }
    // if player has chosen less then three card
    if game.chosenCards.count < 3 {
      if let indexOfChosenCard = buttons.index(of: sender) {
        
        let chosenCard = game.cardsOnTable[indexOfChosenCard]
        
        if game.chosenCards.contains(chosenCard) {
          unSelectCard(select: sender)
          chosenButtons.remove(at: buttonIndex)
          game.chosenCards.remove(at: game.chosenCards.index(of: chosenCard)!)
        }
        else {
          seletCard(select: sender)
          chosenButtons.append(sender)
          game.chosenCards.append(chosenCard)
        }
      }
    }
      
      //if three cards has chosen
    else {
      let card1 = game.chosenCards[0]
      let card2 = game.chosenCards[1]
      let card3 = game.chosenCards[2]
      
      if game.areMakeASet(firsCard: card1, secondCard: card2, thirdCard: card3) {
        for button in chosenButtons {
          unSelectCard(select: button)
          button.isHidden = true
          button.isEnabled = false
        }
        
        
      }
    }
    print("-------------------------------\n")
    print("chosen cards: \(game.chosenCards.count)")
  }
  
  
  func seletCard(select button: UIButton) {
    button.layer.borderWidth = 3
    button.layer.borderColor = UIColor.blue.cgColor
  }
  
  
  func unSelectCard(select button: UIButton) {
    button.layer.borderWidth = 0
    button.layer.borderColor = UIColor.white.cgColor
  }
  
  
  
}

