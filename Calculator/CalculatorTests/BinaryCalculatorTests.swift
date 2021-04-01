//
//  BinaryCalculatorTests.swift
//  CalculatorTests
//
//  Created by 배은서 on 2021/04/01.
//

import XCTest
@testable import Calculator

class BinaryCalculatorTests: XCTestCase {
    let sut = BinaryCalculator.shared

    override func tearDownWithError() throws {
        sut.clear()
        try super.tearDownWithError()
    }

}
