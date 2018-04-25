import UIKit

struct SetModel {
  
  var matchedCards = [Card]()
  var cards = [Card]()
  var cardsOnTable = [Card]()
  var chosenCards = [Card]()
  
  func areMakeASet() -> Bool {
    let firstCard = chosenCards[0]
    let secondCard = chosenCards[1]
    let thirdCard = chosenCards[2]
    
    let colors = [firstCard.color, secondCard.color, thirdCard.color]
    let shapes = [firstCard.shape, secondCard.shape, thirdCard.shape]
    let numbers = [firstCard.number, secondCard.number, thirdCard.number]
    let shadings = [firstCard.shading, secondCard.shading, thirdCard.shading]
    
    let uniqueColors = Array(Set(colors))
    let uniqueShapes = Array(Set(shapes))
    let uniqueNumbers  = Array(Set(numbers))
    let uniqueShadings = Array(Set(shadings))
    
    return !(uniqueColors.count == 2 || uniqueShapes.count == 2 || uniqueNumbers.count == 2 || uniqueShadings.count == 2)
  }
  
}

