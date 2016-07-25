//
//  EngineProtocol.swift
//  Assignment4
//
//  Created by Krzysztof Dziewiszek on 7/16/16.
//  Copyright © 2016 Katherine Dziewiszek. All rights reserved.
//

import Foundation


protocol EngineProtocol {
    var delegate: EngineDelegate? {get set}
    var grid: GridProtocol! {get}
    var refreshRate: Double {get set}
    var refreshTimer:NSTimer? { get set }
    var rows: Int { get set }
    var cols: Int { get set }
    init(_rows:Int, _cols:Int)
    func step() -> GridProtocol
}

extension EngineProtocol {
    var refreshRate: Double { return 0 }
}