//
//  CellState.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/16/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation

enum CellState {
    case empty
    case died
    case born
    case living
    func isLiving() -> Bool {
        switch self {
        case .living, .born: return true
        case .died, .empty: return false
        }
    }


    
    func toggle(value:CellState)-> CellState{
        switch (self) {
        case .empty:
            return .living
        case .died:
            return .living
        case .living:
            return .empty
        case .born:
            return .empty
            
        }
    }// end toggle
}

struct Cell {
    var position:Position
    var state:   CellState
    init( _ position: Position, _ state: CellState) {
        self.position = position
        self.state = state
    }
}



typealias CellInitializer = () -> CellState