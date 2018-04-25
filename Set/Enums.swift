import UIKit
import GameplayKit

enum Shading {
  case Striped, Filled, Outlined
  static let all = [Shading.Striped, .Filled, .Outlined]
}

enum Number {
  static var all = [1, 2, 3]
}

enum Shape {
  case Sphere, Square, Triangle
  static let all = [Shape.Sphere, .Square, .Triangle]
}

enum Color {
  static let all = [UIColor.red, .green, .purple]
}

extension Array {
  mutating func shuffle() {
    self = (GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self) as! Array<Element>)
  }
}

extension Int {
  func arc4random() -> Int {
    return  Int(arc4random_uniform(UInt32(self)))
  }
}


