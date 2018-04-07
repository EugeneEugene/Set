import UIKit

struct SetModel {
  
  var matchedCards = [Card]()
  var cards = [Card]()
  var cardsOnTable = [Card]()
  var chosenCards = [Card]()
  
  
  let numbers:[Number] = [.One, .Two, .Three]
  let colors: [UIColor] = [.red, .green, .purple]
  let shapes: [Shape] = [.Square, .Sphere, .Triangle]
  let shadings: [Shading] = [.Striped, .Filled, .Outlined]
  
  init() {
    for number in numbers {
      for color in colors {
        for shape in shapes {
          for shading in shadings {
            cards.append(Card(put: shape, times: number, apply: shading, paint: color))                    }
        }
      }
    }
    cards.shuffle()
  }
  
  func areMakeASet(firsCard: Card, secondCard: Card, thirdCard: Card) -> Bool {
    let colors = [firsCard.color, secondCard.color, thirdCard.color]
    let shapes = [firsCard.shape, secondCard.shape, thirdCard.shape]
    let numbers = [firsCard.number, secondCard.number, thirdCard.number]
    let shadings = [firsCard.shading, secondCard.shading, thirdCard.shading]
    
    let uniqueColors = Array(Set(colors))
    let uniqueShapes = Array(Set(shapes))
    let uniqueNumbers  = Array(Set(numbers))
    let uniqueShadings = Array(Set(shadings))
    
    return !(uniqueColors.count == 2 || uniqueShapes.count == 2 || uniqueNumbers.count == 2 || uniqueShadings.count == 2)
  }
  
}

