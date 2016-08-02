//
//  GridView.swift
//  ProjectPrototype
//
//  Created by Van Simmons on 7/23/16.
//  Copyright © 2016 S65g. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    //var gr : GridProtocol
    var cellLength : CGFloat = 0.0
    
    var drawGrid: GridProtocol{
        get{
            return StandardEngine.sharedInstance.grid
        }
        set{
            StandardEngine.sharedInstance.grid = drawGrid
        }
    }
    
    var rows = StandardEngine.sharedInstance.rows
    
    var columns = StandardEngine.sharedInstance.cols
    
    var points:[(Int,Int)] = []
        
    var pnts:[(Int,Int)] {

        set{
            for p in points.enumerate(){
                drawGrid[p.element] = CellState.Alive
            }
        }
        
        get{
            return points
        }
    }
    
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.whiteColor()
    @IBInspectable var bornColor: UIColor = UIColor.yellowColor()
    @IBInspectable var diedColor: UIColor = UIColor.grayColor()
    @IBInspectable var gridColor: UIColor = UIColor.grayColor()
    @IBInspectable var gridWidth: CGFloat = CGFloat(2.0)
    
    
    
    override func drawRect(rect: CGRect) {
        
        super.drawRect(rect)
        
        let plusPath = UIBezierPath()
        let viewWidth:CGFloat = self.bounds.width
        let viewHeight:CGFloat = self.bounds.height
        
        let x1:CGFloat = 0.0
        let x2:CGFloat = viewWidth
        
        let y1:CGFloat = 0.0
        let y2:CGFloat = viewHeight
        
        cellLength = min(viewHeight, viewWidth) / CGFloat(rows)
        
        
        _ = UIGraphicsGetCurrentContext()
        
        plusPath.lineWidth = gridWidth
        
        
        // draw horizontal lines
        var i:CGFloat = 0.0
        repeat {
            
            plusPath.moveToPoint(CGPoint(
                x:x1,
                y:cellLength + i))
            
            plusPath.addLineToPoint(CGPoint(
                x:x2,
                y:cellLength + i))
            
            
            i = i + cellLength
            
        } while i < rect.height - cellLength
        
        
        // draw vertical lines
        var j:CGFloat = 0.0
        
        repeat {
            
            plusPath.moveToPoint(CGPoint(
                x:cellLength + j,
                y:y1))
            
            plusPath.addLineToPoint(CGPoint(
                x:cellLength + j,
                y:y2))
            
            
            j = j + cellLength
            
        } while j < rect.width - cellLength
        
        //top line
        plusPath.moveToPoint(CGPoint(
            x:x1,
            y:y1))
        
        //add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:viewWidth,
            y:y1))
        
        //left line
        plusPath.moveToPoint(CGPoint(
            x:x1,
            y:y1))
        
        //add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:x1,
            y:viewHeight))
        
        //right line
        plusPath.moveToPoint(CGPoint(
            x:viewWidth,
            y:y1))
        
        //add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:viewWidth,
            y:viewHeight))
        
        //bottom line
        plusPath.moveToPoint(CGPoint(
            x:viewWidth,
            y:viewHeight))
        
        //add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(
            x:x1,
            y:viewHeight))
        
        
        
        gridColor.setStroke()
        plusPath.stroke()
        
        var cx = CGPointZero.x
        var cy = CGPointZero.y
        var xArray = 0
        var yArray = 0
        
        
        
        for _ in 0...columns-1{
            for _ in 0...rows-1{
                let crect2 = CGRectMake(cx, cy, cellLength, cellLength)
                let path2 = UIBezierPath(ovalInRect: crect2)
                path2.stroke()
                
                switch drawGrid[xArray,yArray]{
                case CellState.Alive:
                    livingColor.setFill()
                case CellState.Empty:
                    emptyColor.setFill()
                case CellState.Born:
                    bornColor.setFill()
                case CellState.Died:
                    diedColor.setFill()
                }
                
                path2.fill()
                yArray += 1
                cy += cellLength
                
                
            }
            yArray = 0
            cy = CGPointZero.y
            cx += cellLength
            xArray += 1
            
        }
        
        //print(grid)
        //self.setNeedsDisplay()
        
    }// end draw rect
    
}



extension GridView{
    func findPoint(x:Int,y:Int) -> (x:Int, y:Int){
        let touchx = x/Int(cellLength)
        let touchy = y/Int(cellLength)
        
        return (touchx, touchy)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(self)
            let find = findPoint(Int(position.x), y: Int(position.y))
            //print(find.x)
            //print(find.y)
            _ = CellState.Empty
            
            
            if drawGrid[find.x,find.y] == CellState.Empty
            {
                //currentState.toggle(.empty)
                drawGrid[find.x,find.y] = CellState.Alive
            } else
            {
                drawGrid[find.x,find.y] = CellState.Empty
            }
        }
        //print()
        self.setNeedsDisplay()
        
        
        
        
        
    }
    
   
    
}