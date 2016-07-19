//
//  Grid.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/16/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation

class Grid : GridProtocol {
    //var grid = (rows:10, cols:10)
    var grid : [[CellState]]
    
    
    var _cols: UInt=10;
    
    var _rows: UInt=10;
   

    required init (_rows: UInt, _cols: UInt)
    {
        self._rows = _rows
        self._cols = _cols
        
        let tmpArray = Array(count: Int(_rows),
                             repeatedValue: Array(count:Int(_cols),
                                repeatedValue:CellState.empty))
        self.grid = tmpArray
        
        
    }

    subscript(row: UInt, col: UInt) -> CellState? {
        get {
            if grid.count < Int(row*col) { return nil }
            return grid[Int(row)][Int(col)]
        }
        set (newValue) {
            if newValue == nil { return }
            if row < 0 || row >= _rows || col < 0 || col >= _cols { return }
            grid[Int(row)][Int(col)] = newValue!
        }
    }
    

    func neighbors(row: Int, col: Int) -> [(row: Int, col: Int)] {

        var neighborsArray:[(row: Int, col: Int)] = []
        let numOfRows = Int(_rows - 1)
        let numOfColumns = Int(_cols - 1)
        
        
        //neighbor a
        var ax1 = 0
        var ay1 = 0
        
        ax1 = (row-1)
        ay1 = (col-1)
        
        
        if (ax1 < 0)
        {
            ax1 = numOfRows
        }
        
        if (ay1 < numOfColumns)
        {
            ay1 = 0 //first column
        }
        
        
        neighborsArray += [(row: ax1, col: ay1)]
        
        
        
        //print(neighborsArray)
        
        
        //neighbor b
        
        var bx = 0
        var by = 0
        
        bx = (row-1)
        by = (col)
        
        switch bx {
        case -1:
            bx = numOfRows
        default:
            bx = (row-1)
        }
        
        
        neighborsArray += [(row: bx, col: by)]
        
        
        //neighbor c
        
        var cx = 0
        var cy = 0
        
        cx = (row-1)
        cy = (col+1)
        
        
        if (cx < 0)
        {
            cx = numOfRows
        }
        
        if (cy > numOfColumns)
        {
            cy = 0 //first column
        }
        
        
        neighborsArray += [(row: cx, col: cy)]
        
        //neighbor d
        
        var dx = 0
        var dy = 0
        
        dx = row
        dy = (col-1)
        
        
        
        if (dy < 0)
        {
            dy = numOfColumns //last column
        }
        
        neighborsArray += [(row: dx, col: dy)]
        
        
        
        
        //neighbor e
        
        var ex = 0
        var ey = 0
        
        ex = (row)
        ey = (col+1)
        
        
        if ((ey) > numOfColumns)
        {
            ey = 0 //first column
        }
        neighborsArray += [(row: ex, col: ey)]
        
        
        
        //neighbor f
        
        var fx = 0
        var fy = 0
        
        fx = (row+1)
        fy = (col-1)
        
        
        
        if (fx > numOfRows)
        {
            fx = 0 //first row
        }
        
        if (fy < 0)
        {
            fy = numOfColumns //last column
        }
        neighborsArray += [(row: fx, col: fy)]
        
        
        //neighbor g
        
        var gx = 0
        var gy = 0
        
        gx = (row+1)
        gy = (col)
        
        
        
        if (gx > numOfRows)
        {
            gx = 0 //first row
        }
        
        
        neighborsArray += [(row: gx, col:gy)]
        
        //neighbor h
        
        var hx = 0
        var hy = 0
        
        hx = (row+1)
        hy = (col+1)
        
        
        
        if (hx > numOfRows)
        {
            hx = 0 //first row
        }
        
        if (hy > numOfColumns)
        {
            hy = 0 //first column
        }
        
        neighborsArray += [(row: hx, col:hy)]
        
        
        return neighborsArray
        
        
        
    }//end neighbors





}