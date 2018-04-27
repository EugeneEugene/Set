import UIKit

class ViewController: UIViewController {
    
    lazy var game = SetModel()
    var deck = CardDeck().deck
    
    @IBOutlet weak var playingTable: PlayingTable!
    
    override func viewDidLoad() {
        for index in 0..<playingTable.grid.cellCount{
            let card = deck.remove(at: 0)
            let cardView = CardView(frame: playingTable.grid[index]!)
            cardView.color = card.color
            cardView.number = card.number
            cardView.shape = card.shape
            cardView.shading = card.shading
            
            cardView.accessibilityFrame =  cardView.accessibilityFrame.zoom(by: 0.25)
            
            playingTable.addSubview(cardView)
        }
        super.viewDidLoad()
    }
    
}
