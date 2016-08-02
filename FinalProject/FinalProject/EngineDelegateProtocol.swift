//
//  EngineDelegateProtocol.swift
//  FinalProject
//
//  Created by Krzysztof Dziewiszek on 8/2/16.
//  Copyright © 2016 kad. All rights reserved.
//

import Foundation

protocol  EngineDelegate: class {
    func engineDidUpdate(withGrid: GridProtocol)
}