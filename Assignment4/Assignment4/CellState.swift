//
//  CellState.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/16/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation

enum CellState: String {
    case living = "living"
    case empty = "empty"
    case born = "born"
    case died = "died"
    
    
    //method
    func description()-> String {
        switch(self) {
        case .living:
            return CellState.living.rawValue
        case .empty:
            return CellState.empty.rawValue
        case .born:
            return CellState.born.rawValue
        case .died:
            return CellState.died.rawValue
            
        }//end switch
    }//end method
    
    func allValues()-> [CellState]{
        
        let cellStates_array: [CellState] = [.living, .empty, .born, .died]
        
        return cellStates_array
    }//end method
    
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