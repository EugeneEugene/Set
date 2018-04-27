import UIKit
import GameplayKit

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


