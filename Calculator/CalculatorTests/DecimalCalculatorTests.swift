//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 배은서 on 2021/04/01.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    let sut = DecimalCalculator.shared

    override func tearDownWithError() throws {
        sut.clear()
        try super.tearDownWithError()
    }
    
}
