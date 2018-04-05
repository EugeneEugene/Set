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
  
  @IBOutlet weak var addMore: UIButton!
  
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
    // if player has chosen less then three card
    if chosenButtons.count == 3 {
      for button in chosenButtons {
        unSelectCard(select: button)
      }
      chosenButtons.removeAll()
      game.chosenCards.removeAll()
    }
    if game.chosenCards.count < 3 {
      if let indexOfChosenCard = buttons.index(of: sender) {
        
        let chosenCard = game.cardsOnTable[indexOfChosenCard]
        
        if game.chosenCards.contains(chosenCard) {
          unSelectCard(select: sender)
          if let indexOfUnselectedCard = chosenButtons.index(of: sender) {
            chosenButtons.remove(at: indexOfUnselectedCard)
            game.chosenCards.remove(at: game.chosenCards.index(of: chosenCard)!)
          }
        }
        else {
          seletCard(select: sender)
          chosenButtons.append(sender)
          game.chosenCards.append(chosenCard)
        }
      }
    }
    if chosenButtons.count == 3 {
      let card1 = game.chosenCards[0]
      let card2 = game.chosenCards[1]
      let card3 = game.chosenCards[2]
      if game.areMakeASet(firsCard: card1, secondCard: card2, thirdCard: card3) {
        showMatching()
      }
      else {
        showNotMatching()
      }
    }
    print("-------------------------------\n")
    print("chosen cards: \(game.chosenCards.count)")
  }
  
  func showMatching() {
    for button in chosenButtons {
      button.layer.borderWidth = 5
      button.layer.borderColor = UIColor.green.cgColor
    }
  }
  
  func showNotMatching() {
    for button in chosenButtons {
      button.layer.borderWidth = 5
      button.layer.borderColor = UIColor.red.cgColor
    }
  }
  
  func seletCard(select button: UIButton) {
    button.layer.borderWidth = 3
    button.layer.borderColor = UIColor.blue.cgColor
  }
  
  func unSelectCard(select button: UIButton) {
    button.layer.borderWidth = 0
    button.layer.borderColor = UIColor.white.cgColor
  }

  @IBAction func addThreeCards(_ sender: UIButton) {
    if game.cards.count < 3 {
      sender.isEnabled = false
    }
    var threeEmptyButtons = [UIButton]()
    for button in buttons {
      if button.isHidden {
        threeEmptyButtons.append(button)
      }
      if threeEmptyButtons.count >= 3 {
        threeEmptyButtons.map({ (button: UIButton) -> UIButton in
          button.isHidden = false
          return button
        })
        break
      }
    }

  }
}

