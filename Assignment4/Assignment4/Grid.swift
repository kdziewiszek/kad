//
//  Grid.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/16/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation




class Grid : GridProtocol {

    var grid : [[CellState]]!
    var cells: [Cell]!
    

    
    private (set) var _rows = 10
    private (set) var _cols = 10

    
    static let offsets:[Position] = [
        Position(-1, -1), Position(-1, 0), Position(-1, 1),
        Position( 0, -1),                  Position( 0, 1),
        Position( 1, -1), Position( 1, 0), Position( 1, 1)
    ]
    
    
    required init (_rows rows: Int, _cols cols: Int, cellInitializer: CellInitializer) {
        _rows = rows
        _cols = cols
        self.cells = (0..<rows*cols).map {
            Cell(Position($0/cols, $0%cols), cellInitializer())
        }
    }


    subscript(row: Int, col: Int) -> CellState? {
        get {
            if grid.count < Int(row*col) { return nil }
            return grid[row][col]
        }
        set (newValue) {
            if newValue == nil { return }
            if row < 0 || row >= _rows || col < 0 || col >= _cols { return }
            grid[row][col] = newValue!
        }
    }
    
    
    
    
    
    func neighbors(pos: Position) -> [Position] {
        return Grid.offsets.map { Position((pos.row + _rows + $0.row) % _rows,
            (pos.col + _cols + $0.col) % _cols) }
    }
    
    func livingNeighbors(cell: Cell) -> Int {
        return self.neighbors(Position(cell.position.row, cell.position.col))
            .reduce(0) { cells[$1.row*_cols + $1.col].state.isLiving() ? $0 + 1 : $0 }
    }




}