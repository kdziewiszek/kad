//
//  GridProtocol.swift
//  FinalProject
//
//  Created by Krzysztof Dziewiszek on 8/2/16.
//  Copyright © 2016 kad. All rights reserved.
//

import Foundation

protocol GridProtocol {
    var rows: Int { get }
    var cols: Int { get }
    var cells: [Cell] { get  set}
    
    var living: Int { get }
    var dead:   Int { get }
    var alive:  Int { get }
    var born:   Int { get }
    var died:   Int { get }
    var empty:  Int { get }
    
    subscript (i:Int, j:Int) -> CellState { get set }
    
    func neighbors(pos: Position) -> [Position]
    func livingNeighbors(position: Position) -> Int
}
