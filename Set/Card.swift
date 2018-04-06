import UIKit

struct Card: Equatable {
  let color: UIColor
  let shape: Shape
  let number: Number
  let shading: Shading
  
  init(put shape: Shape, times number: Number, apply shading: Shading, paint color: UIColor) {
    self.shape = shape
    self.number = number
    self.shading = shading
    self.color = color
  }
  
  static func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.color == rhs.color && lhs.shape == rhs.shape &&
      lhs.number == rhs.number && lhs.shading == rhs.shading
  }
}
