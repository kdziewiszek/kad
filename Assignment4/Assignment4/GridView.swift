//
//  GridView.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/17/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit

@IBDesignable class GridView: UIView {
    
    
    
    
    var grid : [[CellState]]!
    var cellLength : CGFloat = 0.0
    
    
    let height : Int = 0
    let width : Int=0
    
    
    
    func t(height: Int, width: Int)
    {
        
        let tmpArray = Array(count: height,
                             repeatedValue: Array(count: width,
                                repeatedValue: CellState.empty))
        
        self.grid = tmpArray
        
        
        
    }//end t
    
    
    
    @IBInspectable var rows: Int = 20 {
        didSet{
            _ = t(rows, width: 20)
           //grid = Grid(_rows: 20, _cols: columns) { .empty }
            // _ = engine(height: rows, width: 20)
        }
    }
    @IBInspectable var columns: Int = 20{
        didSet{
            //r(20, width_: columns)
           _ = t(20, width: columns)
            // didset and notifydelegate()
            // _ = engine(height: 20, width: columns)
        }
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var livingColor: UIColor = UIColor.greenColor()
    @IBInspectable var emptyColor: UIColor = UIColor.whiteColor()
    @IBInspectable var bornColor: UIColor = UIColor.yellowColor()
    @IBInspectable var diedColor: UIColor = UIColor.grayColor()
    @IBInspectable var gridColor: UIColor = UIColor.blackColor()
    @IBInspectable var gridWidth: CGFloat = CGFloat(2.0)
    
    
    
    func ReadGrid(r:Int,c:Int){
        
        
        //var v = ""
        if (grid[r][c] == CellState.empty)
        {
            emptyColor.setFill()
            
        }
        if (grid[r][c] == CellState.living)
        {
            livingColor.setFill()
            
        }
        if (grid[r][c] == CellState.born)
        {
            bornColor.setFill()
            
        }
        if (grid[r][c] == CellState.died)
        {
            diedColor.setFill()
            
        }
        
    }
    
    
    
    override func drawRect(rect: CGRect) {
        
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
                ReadGrid(xArray, c: yArray)
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
        
        
    }//end draw rect
    
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
            _ = CellState.empty
            
            
            if grid[find.x][find.y] == CellState.empty
            {
                //currentState.toggle(.empty)
                grid[find.x][find.y] = CellState.living
                //print(grid[find.x][find.y])
                print(grid)
            } else
            {
                grid[find.x][find.y] = CellState.empty
            }
            self.setNeedsDisplay()
            
        }
        
    }
    
    
    
}//end gridview
