import UIKit

class ViewController: UIViewController {
  
  lazy var game = SetModel()
  var chosenButtons = [UIButton]()

  @IBOutlet weak var playingTable: PlayingTable!
  override func viewDidLoad() {
//      let cv = CardView(frame: playingTable.bounds)
//      cv.color = UIColor.red
//      cv.shape = .Triangle
//      cv.number = 3
//      cv.shading = .Filled
////      cv.backgroundColor = UIColor.white
//      cv.setNeedsLayout()
////      playingTable.isOpaque = true
//      playingTable.addSubview(cv)
//      playingTable.setNeedsDisplay()
////      playingTable.setNeedsLayout()
//      print(cv)
    super.viewDidLoad()
  }
  
}
