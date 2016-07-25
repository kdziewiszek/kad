//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/15/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation

typealias Position = (row:Int, col:Int)

protocol GridProtocol {
    var grid : [[CellState]]! {get set}
    var cells: [Cell]! {get set}
    //var row: Int { get }
    //var col: Int { get }
    var _rows: Int { get }
    var _cols: Int { get }
    init(_rows rows: Int, _cols cols: Int, cellInitializer: CellInitializer)
    func neighbors(pos: Position) -> [Position]
    func livingNeighbors(cell: Cell) -> Int
    subscript(row: Int, col: Int) -> CellState? { get set }

}