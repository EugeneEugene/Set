//
//  PlayingCardView.swift
//  Set
//
//  Created by eugene on 18/04/2018.
//  Copyright © 2018 eugene. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
  @IBInspectable
  var color = UIColor.red
  var shape = Card.Shape.Triangle
  @IBInspectable
  var number = 3
  var shading = Card.Shading.Striped
  lazy var grid = Grid(layout: .dimensions(rowCount: 3, columnCount: 1), frame: self.bounds)
  
  
  override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    
    UIColor.white.setFill()
    roundedRect.fill()
    var grids = [CGRect]()
    switch number {
    case 1:
      grids.append(grid[1,0]!)
    case 2:
      grids.append(grid[0,0]!)
      grids.append(grid[2,0]!)
    case 3:
      grids.append(grid[0,0]!)
      grids.append(grid[1,0]!)
      grids.append(grid[2,0]!)
    default:
      assert(false, "Incorrect quantity of shapes")
    }
    
    var figurePath = UIBezierPath()
    print("count of greeds: \(grids.count)")
    for grid1 in grids {
//      print("nun")
      switch shape {
      case .Sphere:
        figurePath = UIBezierPath(arcCenter: CGPoint(x: grid1.midX, y: grid1.midY), radius: grid1.height/4, startAngle: CGFloat(0.0), endAngle: CGFloat(Double.pi*2), clockwise: true)
        UIColor.red.setFill()
      case .Square:
        let squareRect = CGRect(x: grid1.midX/2, y: grid1.minY, width: grid1.height, height: grid1.height)
        figurePath = UIBezierPath(rect: squareRect.zoom(by: 0.5))
      case .Triangle:
        
        figurePath.move(to: CGPoint(x: grid1.midX, y: grid1.midY - 1/4*grid1.height))
        figurePath.addLine(to: CGPoint(x: grid1.midX+1/4*grid1.width, y: grid1.midY+1/4*grid1.height))
        figurePath.addLine(to: CGPoint(x: grid1.midX-1/4*grid1.width, y: grid1.midY+1/4*grid1.height))
        figurePath.close()
      }
      context?.saveGState()
      figurePath.addClip()
      switch shading {
      case .Filled:
        color.setFill()
        figurePath.fill()
      case .Outlined:
        color.setStroke()
        figurePath.stroke()
      case .Striped:
        var newGrid = Grid(layout:  .dimensions(rowCount: 1, columnCount: 200), frame: grid1)
        for i in 0..<newGrid.cellCount {
          if i%5 == 0 {
            let line = UIBezierPath(rect: newGrid[0,i]!)
            color.setFill()
            line.fill()
          }
        }
        color.setStroke()
        figurePath.stroke()
      }
        context?.restoreGState()
    }
    
  }
}

extension CardView {
  private struct SizeRatio {
    static let cornerRadiusToBoundsHeight: CGFloat = 0.06
  }
  
  private var cornerRadius: CGFloat {
    return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
  }
}


extension CGRect {
  func zoom(by zoomFactor: CGFloat) -> CGRect {
    let zoomedWidth = size.width * zoomFactor
    let zoomedHeight = size.height * zoomFactor
    let originX = origin.x + (size.width - zoomedWidth) / 2
    let originY = origin.y + (size.height - zoomedHeight) / 2
    return CGRect(origin: CGPoint(x: originX,y: originY) , size: CGSize(width: zoomedWidth, height: zoomedHeight))
  }
}

