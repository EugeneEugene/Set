//
//  PlayingTable.swift
//  Set
//
//  Created by eugene on 25/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit


class PlayingTable: UIView {
  lazy var grid = Grid(layout: .dimensions(rowCount: 3, columnCount: 3), frame: self.bounds)

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         Drawing code
    }
    */

}
