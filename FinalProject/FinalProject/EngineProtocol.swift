//
//  EngineProtocol.swift
//  FinalProject
//
//  Created by Krzysztof Dziewiszek on 8/2/16.
//  Copyright © 2016 kad. All rights reserved.
//

import Foundation

protocol EngineProtocol {
    var rows: Int { get set }
    var cols: Int { get set }
    var grid: GridProtocol { get }
    weak var delegate: EngineDelegate? { get set }
    
    var refreshRate:  Double { get set }
    var refreshTimer: NSTimer? { get set }
    
    func step() -> GridProtocol
}