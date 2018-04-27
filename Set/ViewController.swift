import UIKit

class ViewController: UIViewController {
    
    lazy var game = SetModel()
    var deck = CardDeck().deck
    
    @IBOutlet weak var playingTable: PlayingTable!
    
    override func viewDidLoad() {
        playingTable.grid = Grid(layout: .dimensions(rowCount: 3, columnCount: 2), frame: playingTable.bounds)

        for index in 0..<playingTable.grid.cellCount{
            let card = deck.remove(at: 0)
            let cardView = CardView(frame: playingTable.grid[index]!)
            cardView.color = card.color
            cardView.number = card.number
            cardView.shape = card.shape
            cardView.shading = card.shading
            playingTable.addSubview(cardView)
        }
        super.viewDidLoad()
    }
    
}
