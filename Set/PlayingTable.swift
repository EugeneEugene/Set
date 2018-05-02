//
//  PlayingTable.swift
//  Set
//
//  Created by eugene on 25/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

@IBDesignable
class PlayingTable: UIView { 
    var grid: Grid {
        didSet {
            grid.frame = bounds
        }
    }
    
    override init(frame: CGRect) {
        grid = Grid(layout: .dimensions(rowCount: 1, columnCount: 1), frame: frame)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        grid = Grid(layout: .dimensions(rowCount: 1, columnCount: 2), frame: CGRect.zero)
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        grid.frame = bounds
        backgroundColor = UIColor.red
        print("count: \(grid.cellCount)")
        
    }
    
    
    
}

