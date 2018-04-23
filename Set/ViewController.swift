import UIKit

class ViewController: UIViewController {
  
  lazy var game = SetModel()
  var chosenButtons = [UIButton]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
  
  
  

}
