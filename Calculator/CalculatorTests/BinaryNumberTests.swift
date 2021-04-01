//
//  BinaryNumberTests.swift
//  CalculatorTests
//
//  Created by 배은서 on 2021/04/01.
//

import XCTest
@testable import Calculator

class BinaryNumberTests: XCTestCase {
    var sut: BinaryNumber!

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
