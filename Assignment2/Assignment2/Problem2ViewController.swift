//
//  Problem2ViewController.swift
//  Assignment2
//
//  Created by Krzysztof Dziewiszek on 7/1/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import UIKit


class Problem2ViewController: UIViewController{

    @IBOutlet weak var myTxt: UITextView!
    
    class TwoDimensional {
        let height : Int
        let width : Int
        

        var twoDimArrayOfInt : [[Bool]]
        var duplicateArray : [[Bool]] = []
        
        
        
        init (height: Int, width: Int)
        {
            self.height = height
            self.width = width
            
            let tmpArray = Array(count: height,
                                 repeatedValue: Array(count:width,
                                    repeatedValue:false))
            
            self.twoDimArrayOfInt = tmpArray
            self.duplicateArray = tmpArray
            
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
        
        func printArray()
        {
            for bArray in twoDimArrayOfInt {
                var stringToLog = ""
                for bValue in bArray {
                    stringToLog += "\(bValue) "
                }
                print(stringToLog)
            }
            
        }
        
        //In the following function I know im not using a switch but it took me so long to even figure this out that I didn't have the time to then make it a switch
        func printStuff()
        {
            for (i,row) in twoDimArrayOfInt.enumerate()
            {
                for (j, _) in row.enumerate()
                {
                    var numOfN = 0
                    let x = i
                    let y = j
                    let numOfRows = width - 1 
                    let numOfColumns = height - 1
                    
                    
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
                    
                    if (twoDimArrayOfInt[ax][ay] == true)
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
                    
                    if (twoDimArrayOfInt[bx][by] == true)
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
                    
                    if (twoDimArrayOfInt[cx][cy] == true)
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
                    
                    
                    if (twoDimArrayOfInt[dx][dy] == true)
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
                    
                    if (twoDimArrayOfInt[ex][ey] == true)
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
                    
                    
                    if (twoDimArrayOfInt[fx][fy] == true)
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
                    
                    if (twoDimArrayOfInt[gx][gy] == true)
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
                    
                    if (twoDimArrayOfInt[hx][hy] == true)
                    {
                        numOfN += 1
                    }
                    
                    if (numOfN < 2)
                    {
                        duplicateArray[i][j] = false
                    }
                    
                    if (numOfN == 2 || numOfN == 3)
                    {
                        duplicateArray[i][j] = true
                    }
                    
                    if (numOfN > 3 && twoDimArrayOfInt[i][j] == true)
                    {
                        duplicateArray[i][j] = false
                    }
                    if (numOfN == 3 && twoDimArrayOfInt[i][j] == false)
                    {
                        duplicateArray[i][j] = true
                    }
                    //print(numOfN)
                    
                    
                }
            }
            
            
        }
        func printArray2() {
            for bArray in duplicateArray {
                var stringToLog = ""
                for bValue in bArray {
                    stringToLog += "\(bValue) "
                }
                print(stringToLog)
            }
        }
        
        func countLive() -> Int?
        {
            var alive = 0
            //d1 dimension1 d2 dimension2
            for d1 in duplicateArray{
                for d2 in d1{
                    if d2 == true{
                        alive += 1
                    }
                }
            }
            return alive
        } // end countLive
        
    }//end class
    
    
    
    
    @IBAction func myBtn(sender: AnyObject) {
        let my2D = TwoDimensional(height: 5, width: 5)
        my2D.printArray()
        my2D.printStuff()
        my2D.printArray2()
        if let live = my2D.countLive(){
            myTxt.text = String(live)
        }
        } //end action

    
}//end Problem2ViewController
