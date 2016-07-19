//
//  GridProtocol.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/15/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation

protocol GridProtocol {
    var _rows: UInt { get }
    var _cols: UInt { get }
    init(_rows:UInt, _cols:UInt)
    func neighbors(row: Int, col:Int) -> [(row:Int, col:Int)]
    subscript(row: UInt, col: UInt) -> CellState? { get set }

}