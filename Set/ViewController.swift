import UIKit
@IBDesignable
class ViewController: UIViewController {
    
    lazy var game = SetModel()
    var deck = CardDeck().deck
    
    @IBOutlet weak var playingTable: PlayingTable! {
        didSet {
            playingTable.grid.frame = playingTable.bounds
        }
    }
    
    override func viewDidLoad() {
        for index in 0..<playingTable.grid.cellCount{
            let card = deck.remove(at: 0)
            let cardView = CardView(frame: playingTable.grid[index]!)
            cardView.color = card.color
            cardView.number = card.number
            cardView.shape = card.shape
            cardView.shading = card.shading
            playingTable.addSubview(cardView)
        }
         view.addSubview(playingTable)
        
    }
    

    
    
    
}
