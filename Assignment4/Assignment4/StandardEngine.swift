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
                                                               userInfo: ["knownKey", Grid.self],
                                                               repeats: true
                )
            }
            else if let refreshTimer = refreshTimer{
                refreshTimer.invalidate()
                self.refreshTimer = nil
            }
        }
    }
    
    var rows: Int
    var cols: Int
    var cells: [Cell]!
    
    
    
    required init (_rows : Int, _cols : Int)
    {
        rows = _rows
        cols = _cols
        grid = Grid(_rows: self.rows, _cols: self.cols) { arc4random_uniform(3) == 1 ? .living : .empty }
        
        
    }
    //grid = Grid(_rows: rows,_cols: cols) { arc4random_uniform(3) == 1 ? .living : .empty }
    
    func step() -> GridProtocol {
       
        let newGr = Grid(_rows: self.rows, _cols: self.cols) { .empty }
        
        newGr.cells = cells.map{
            switch grid.livingNeighbors($0){
            case 2 where $0.state.isLiving(),
            3 where $0.state.isLiving():
                return Cell($0.position, .living)
            case 3 where !$0.state.isLiving():
                return Cell($0.position, .born)
            case _ where $0.state.isLiving():
                return Cell($0.position, .died)
            default:
                return Cell($0.position, .empty)
            }
            
        }
        
        /*for row in 0..<grid._rows {
            for col in 0..<grid._cols{
                var numOfN = 0
                //get the neighbors
                //get the count of neighbors
                //get status of the cells if they are alive or not
                //implement the rules
                //take care of born to living
                //died to empty
                let nhs = grid.neighbors(Position)
                var a1: Int = 0
                var a2:Int = 0
                
                for (_, element) in nhs.enumerate(){
                    a1=element.row
                    a2=element.col
                    
                    
                    if (grid[a1,a2] == CellState.living){
                        numOfN += 1
                        
                    }
                    
                }
                
                if (numOfN < 2)
                {
                    newGr[a1,a2] = CellState.empty
                }
                
                
                if (numOfN == 2 && grid[a1,a2] == CellState.living)
                {
                    newGr[a1,a2] = CellState.living
                }
                
                if (numOfN == 3 && grid[a1,a2] == CellState.living)
                {
                    newGr[a1,a2] = CellState.living
                }
                
                if (numOfN > 3 && grid[a1,a2] == CellState.living)
                {
                    newGr[a1,a2] = CellState.empty
                }
                if (numOfN == 3 && grid[a1,a2] == CellState.empty)
                {
                    newGr[a1,a2] = CellState.living
                }
                
                
            }

                
            }*/


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
        let center = NSNotificationCenter.defaultCenter()
        let n = NSNotification(name: "EngineNotification",
                               object: nil
                               )
        center.postNotification(n)
        center.postNotificationName("EngineNotification", object: nil, userInfo: ["knownKey" : Grid.self])
        //statistics need to be listening might need some helper functions would be good
        //

    }

    
}