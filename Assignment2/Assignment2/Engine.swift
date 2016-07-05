//
//  engine.swift
//  Assignment2
//
//  Created by Krzysztof Dziewiszek on 7/3/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation
import UIKit

class prob3
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
        
    }



    
    func step (arr:[[Bool]]) -> [[Bool]]
    {
        var duplicateArray = twoDimArrayOfInt
        for (r,row) in arr.enumerate(){
            for (c, _) in row.enumerate(){
  
                            var numOfN = 0
                            let x = r
                            let y = c
                            let numOfRows = width - 1 // 9
                            let numOfColumns = height - 1 //9
                            
                            
                            //neighbor a
                            var ax = 0
                            var ay = 0
                            
                            ax = (x-1)
                            ay = (y-1)
                            
                            
                            if (ax < 0)
                            {
                                ax = numOfRows //last row
                            }
                            
                            if (ay < 0)
                            {
                                ay = numOfColumns //last column
                            }
                            
                            if (arr[ax][ay] == true)
                            {
                                numOfN += 1
                            }
                            
                            //neighbor b
                            
                            var bx = 0
                            var by = 0
                            
                            bx = (x-1)
                            by = (y)
                            
                            if (bx < 0)
                            {
                                bx = numOfRows //last row
                            }
                            
                            if (arr[bx][by] == true)
                            {
                                numOfN += 1
                            }
                            
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
                            
                            if (arr[cx][cy] == true)
                            {
                                numOfN += 1
                            }
                            
                            //neighbor d
                            
                            var dx = 0
                            var dy = 0
                            
                            dx = x
                            dy = (y-1)
                            
                            
                            
                            if (dy < 0)
                            {
                                dy = numOfColumns //last column
                            }
                            
                            
                            if (arr[dx][dy] == true)
                            {
                                numOfN += 1
                            }
                            
                            
                            
                            //neighbor e
                            
                            var ex = 0
                            var ey = 0
                            
                            ex = (x)
                            ey = (y+1)
                            
                            
                            if ((ey) > numOfColumns)
                            {
                                ey = 0 //first column
                            }
                            
                            if (arr[ex][ey] == true)
                            {
                                numOfN += 1
                            }
                            
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
                            
                            
                            if (arr[fx][fy] == true)
                            {
                                numOfN += 1
                            }
                            
                            
                            
                            //neighbor g
                            
                            var gx = 0
                            var gy = 0
                            
                            gx = (x+1)
                            gy = (y)
                            
                            
                            
                            if (gx > numOfRows)
                            {
                                gx = 0 //first row
                            }
                            
                            if (arr[gx][gy] == true)
                            {
                                numOfN += 1
                            }
                            
                            
                            
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
                            
                            //change status
                            
                            if (arr[hx][hy] == true)
                            {
                                numOfN += 1
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
                            //print(numOfN)
                
                            
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
