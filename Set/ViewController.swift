import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var buttons: [UIButton]!
  lazy var game = SetModel()
  var chosenButtons = [UIButton]()
  
  @IBOutlet weak var addMore: UIButton!
  
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
    if chosenButtons.count == 3 {
      if game.areMakeASet() {
        replaceThreeCard()
      }
      unSelectChosen()
    }
    if chosenButtons.count < 3 {
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
    if game.chosenCards.count == 3 {
      if game.areMakeASet() {
        showMatching()
        addMore.isEnabled = true 
      }
      else {
        showNotMatching()
      }
    }
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
  
  func unSelectChosen() {
    for button in chosenButtons {
      button.layer.borderWidth = 0
      button.layer.borderColor = UIColor.white.cgColor
    }
    chosenButtons.removeAll()
    game.chosenCards.removeAll()
  }
  
  @IBAction func addThreeCards(_ sender: UIButton) {
    if game.cards.count < 3 {
      sender.isEnabled = false
      return
    }
    if chosenButtons.count == 3, game.cards.count >= 3 {
      
      if game.areMakeASet() {
        if game.cards.count >= 3 {
          replaceThreeCard()
        }
        else {
          chosenButtons[0].isHidden = true
          chosenButtons[1].isHidden = true
          chosenButtons[2].isHidden = true
        }
      }
    }
        
      else {
        print("kek")
        let shownButtons =  buttons.filter { $0.isHidden == true }
        if (shownButtons.count) < 3 {
          addMore.isEnabled = false
        }
        else {
          shownButtons[0].isHidden = false
          shownButtons[1].isHidden = false
          shownButtons[2].isHidden = false
        }
      }
    }
  
  
  func replaceThreeCard() {
    let cardNew1 = game.cards.remove(at: 0)
    let cardNew2 = game.cards.remove(at: 0)
    let cardNew3 = game.cards.remove(at: 0)
    game.chosenCards.removeAll()
    renderCard(render: cardNew1, on: chosenButtons[0])
    renderCard(render: cardNew2, on: chosenButtons[1])
    renderCard(render: cardNew3, on: chosenButtons[2])
    
  }
}
