//
//  StandardEngine.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/16/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation


class StandardEngine : EngineProtocol {
    
    var delegate: EngineDelegate?
    
    var grid: GridProtocol!
    
    var refreshTimer:NSTimer?
    
    var refreshRate: NSTimeInterval = 0 {
        didSet {
            if refreshRate != 0 {
                if let refreshTimer = refreshTimer { refreshTimer.invalidate() }
                let sel = #selector(StandardEngine.timerDidFire(_:))
                refreshTimer = NSTimer.scheduledTimerWithTimeInterval(refreshRate,
                                                               target: self,
                                                               selector: sel,
                                                               userInfo: [],
                                                               repeats: true
                )
            }
            else if let refreshTimer = refreshTimer{
                refreshTimer.invalidate()
                self.refreshTimer = nil
            }
        }
    }
    
    var rows: UInt
    var cols: UInt
    
    
    
    required init (_rows : UInt, _cols : UInt)
    {
        self.rows = _rows
        self.cols = _cols
        self.grid = Grid(_rows: _rows, _cols: _cols)
        
        
        
        
    }
    
    
    
    func step() -> GridProtocol {
        
        var newGr = Grid(_rows: grid._rows, _cols: grid._cols)
        for row in 0..<grid._rows {
            for col in 0..<grid._cols{
                var numOfN = 0
                //get the neighbors
                //get the count of neighbors
                //get status of the cells if they are alive or not
                //implement the rules
                //take care of born to living
                //died to empty
                var nhs = grid.neighbors(Int(row), col: Int(col))
                var a1: Int = 0
                var a2:Int = 0
                
                for (_, element) in nhs.enumerate(){
                    a1=element.row
                    a2=element.col
                    
                    
                    if (grid[UInt(a1),UInt(a2)] == CellState.living){
                        numOfN += 1
                        
                    }
                    
                }
                
                if (numOfN < 2)
                {
                    newGr[UInt(a1),UInt(a2)] = CellState.empty
                }
                
                
                if (numOfN == 2 && grid[UInt(a1),UInt(a2)] == CellState.living)
                {
                    newGr[UInt(a1),UInt(a2)] = CellState.living
                }
                
                if (numOfN == 3 && grid[UInt(a1),UInt(a2)] == CellState.living)
                {
                    newGr[UInt(a1),UInt(a2)] = CellState.living
                }
                
                if (numOfN > 3 && grid[UInt(a1),UInt(a2)] == CellState.living)
                {
                    newGr[UInt(a1),UInt(a2)] = CellState.empty
                }
                if (numOfN == 3 && grid[UInt(a1),UInt(a2)] == CellState.empty)
                {
                    newGr[UInt(a1),UInt(a2)] = CellState.living
                }
                
                
            }

                
            }


        return newGr
        
        
    }
    

    private static var _sharedEngine = StandardEngine(_rows : 10, _cols : 10)
    
    static var sharedEngine: StandardEngine {
        get {
            return _sharedEngine
        }
    }


    func notifyDelegate(grid: GridProtocol){
            if let delegate = delegate{
                delegate.engine(grid)
        }
    }

    
    @objc func timerDidFire(refreshTimer:NSTimer) {
        step()
        let center = NSNotificationCenter.defaultCenter()
        let n = NSNotification(name: "EngineNotification",
                               object: nil
                               )
//        center.postNotification(n)
        center.postNotificationName("EngineNotification", object: nil, userInfo: ["knownKey" : Grid.self])
        //statistics need to be listening might need some helper functions would be good
        //

    }

    
}