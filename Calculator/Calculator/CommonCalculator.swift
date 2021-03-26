//
//  CommonCalculator.swift
//  Calculator
//
//  Created by YB on 2021/03/26.
//

import Foundation

protocol CommonCalculator {
    func add() throws -> String
    func subtract() throws -> String
    func clear()
}
