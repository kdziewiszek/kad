//
//  Engine2.swift
//  Assignment2
//
//  Created by Krzysztof Dziewiszek on 7/5/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation
//
//  engine.swift
//  Assignment2
//
//  Created by Krzysztof Dziewiszek on 7/3/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation
import UIKit

class prob4
{
    let height : Int
    let width : Int
    
    
    var twoDimArrayOfInt : Array<Array<Bool>>
    // var duplicateArray : Array<Array<Bool>>
    
    
    
    init (height: Int, width: Int)
    {
        self.height = height
        self.width = width
        
        let tmpArray = Array(count: height,
                             repeatedValue: Array(count:width,
                                repeatedValue:false))
        
        self.twoDimArrayOfInt = tmpArray
        
        for h in 0..<height
        {
            for w in 0..<width
            {
                if arc4random_uniform(2) == 1 {
                    twoDimArrayOfInt[h][w] = true
                }
                
            }
        }
        print(twoDimArrayOfInt)
        
    }
    
    func neighbors(x: Int, y:Int) -> [(pointX:Int, pointY:Int)]
    {
        
    
        var neighborsArray:[(pointX: Int, pointY: Int)] = []
        let numOfRows = width - 1
        let numOfColumns = height - 1

        
        //neighbor a
        var ax = 0
        var ay = 0
        
        ax = (x-1)
        ay = (y-1)
        switch ax {
        case -1:
            ax=numOfRows
        default:
            ax = (x-1)
        }
        
        switch ay {
        case -1:
            ay = numOfColumns
        default:
            ay = y-1
        }
        
        
        neighborsArray += [(pointX: ax, pointY: ay)]
        
  

        //print(neighborsArray)
        
        
        //neighbor b
        
        var bx = 0
        var by = 0
        
        bx = (x-1)
        by = (y)
        
        switch bx {
        case -1:
            bx = numOfRows
        default:
            bx = (x-1)
        }
        
        
        neighborsArray += [(pointX: bx, pointY: by)]

        
        //neighbor c
        
        var cx = 0
        var cy = 0
        
        cx = (x-1)
        cy = (y+1)
        
        
        if (cx < 0)
        {
            cx = numOfRows
        }
        
        if (cy > numOfColumns)
        {
            cy = 0 //first column
        }
        
       
        neighborsArray += [(pointX: cx, pointY: cy)]

        //neighbor d
        
        var dx = 0
        var dy = 0
        
        dx = x
        dy = (y-1)
        
        
        
        if (dy < 0)
        {
            dy = numOfColumns //last column
        }
        
        neighborsArray += [(pointX: dx, pointY: dy)]

        
        
        
        //neighbor e
        
        var ex = 0
        var ey = 0
        
        ex = (x)
        ey = (y+1)
        
        
        if ((ey) > numOfColumns)
        {
            ey = 0 //first column
        }
        neighborsArray += [(pointX: ex, pointY: ey)]

        
        
        //neighbor f
        
        var fx = 0
        var fy = 0
        
        fx = (x+1)
        fy = (y-1)
        
        
        
        if (fx > numOfRows)
        {
            fx = 0 //first row
        }
        
        if (fy < 0)
        {
            fy = numOfColumns //last column
        }
        neighborsArray += [(pointX: fx, pointY: fy)]


        //neighbor g
        
        var gx = 0
        var gy = 0
        
        gx = (x+1)
        gy = (y)
        
        
        
        if (gx > numOfRows)
        {
            gx = 0 //first row
        }
        
       
        neighborsArray += [(pointX: gx, pointY:gy)]
        
        //neighbor h
        
        var hx = 0
        var hy = 0
        
        hx = (x+1)
        hy = (y+1)
        
        
        
        if (hx > numOfRows)
        {
            hx = 0 //first row
        }
        
        if (hy > numOfColumns)
        {
            hy = 0 //first column
        }
        
        neighborsArray += [(pointX: hx, pointY:hy)]
        
        
        return neighborsArray
        
        
        
    }
    
    
    func step2 (arr:[[Bool]]) -> [[Bool]]
    {
       var duplicateArray = twoDimArrayOfInt
         //  var count = 0
        for (r,row) in arr.enumerate(){
            for (c, _) in row.enumerate(){
                
                var numOfN = 0
                let x = r
                let y = c
                
                //  print(neighbors(x, y: y) )
                let nhs = neighbors(x, y: y)

                var ax: Int , ay:Int
                
                // var tf = false
                //_row += 1
                //change status
                for (_, element) in nhs.enumerate() {
                    ax=element.pointX
                    ay=element.pointY
                    if (arr[ax][ay] == true)
                    {
                        numOfN += 1
                        //tf = true
                    }
                  //  print("count \(tf): \"\"count \(_row): \"Item \(index): \(element)")

                    
                }
                
                
                if (numOfN < 2)
                {
                   duplicateArray[r][c] = false
                }
            
                
                if (numOfN == 2 || numOfN == 3)
                {
                    duplicateArray[r][c] = true
                }
                
                if (numOfN > 3 && twoDimArrayOfInt[r][c] == true)
                {
                    duplicateArray[r][c] = false
                }
                if (numOfN == 3 && twoDimArrayOfInt[r][c] == false)
                {
                    duplicateArray[r][c] = true
                }
                    
                print(numOfN)
            
            }
            
                
            }
        
        return duplicateArray
        
    }//end step
    
    
    func countLive(arr:[[Bool]]) -> Int?
    {
        var alive = 0
        //d1 dimension1 d2 dimension2
        for d1 in arr{
            for d2 in d1{
                if d2 == true{
                    alive += 1
                }
            }
        }
        return alive
    } // end countLive
    
}//fin clase
