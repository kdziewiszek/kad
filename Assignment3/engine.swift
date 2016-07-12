//
//  engine.swift
//  Assignment3
//
//  Created by Krzysztof Dziewiszek on 7/10/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation

public class engine {
    
    //var height : Int = 0
    //var width : Int = 0
    
    
    var arrayOfState:[[String]]=[]

    
    
func neighbors(x: Int, y:Int, width: Int, height: Int) -> [(pointX:Int, pointY:Int)]
    {
        //var g = GridView()
        //var height = height
        //var width = width
        
        
        var neighborsArray:[(pointX: Int, pointY: Int)] = []
        let numOfRows = width - 1
        let numOfColumns = height - 1
        
        
        //neighbor a
        var ax1 = 0
        var ay1 = 0
        
        ax1 = (x-1)
        ay1 = (y-1)
        
        
        if (ax1 < 0)
        {
            ax1 = numOfRows
        }
        
        if (ay1 < numOfColumns)
        {
            ay1 = 0 //first column
        }
        
        
        neighborsArray += [(pointX: ax1, pointY: ay1)]
        
        
        
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
        
        
        
    }//end neighbors

    
func step2 (arr:[[String]], width: Int, height: Int) -> [[String]]
    {
        var arrayOfState:[[String]]=[]
        var duplicateArray = arrayOfState
        //  var count = 0
        for (r,row) in arr.enumerate(){
            for (c, _) in row.enumerate(){
                
                var numOfN = 0
                let x = r
                let y = c
                
                //  print(neighbors(x, y: y) )
                
                let nhs = neighbors(x, y: y, width: width, height: height)
                
                var a1: Int = 0
                var a2:Int = 0
                
                // var tf = false
                //_row += 1
                //change status
                for (_, element) in nhs.enumerate() {
                    a1=element.pointX
                    a2=element.pointY
                    if (arr[a1][a2] == "living")
                    {
                        numOfN += 1
                        //tf = true
                    }
                    //  print("count \(tf): \"\"count \(_row): \"Item \(index): \(element)")
                    
                    
                }
                
                
                if (numOfN < 2)
                {
                    duplicateArray[r][c] = "empty"
                }
                
                
                if (numOfN == 2 || numOfN == 3)
                {
                    duplicateArray[r][c] = "living"
                }
                
                if (numOfN > 3 && arrayOfState[r][c] == "living")
                {
                    duplicateArray[r][c] = "empty"
                }
                if (numOfN == 3 && arrayOfState[r][c] == "empty")
                {
                    duplicateArray[r][c] = "living"
                }
                
                print(numOfN)
                
            }
            
            
        }
        //print (duplicateArray)
        return duplicateArray
  
        
    }//end step

    
    
    
}//end class