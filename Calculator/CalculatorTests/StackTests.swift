//
//  StackTests.swift
//  CalculatorTests
//
//  Created by 배은서 on 2021/04/01.
//

import XCTest
@testable import Calculator

class StackTests: XCTestCase {
    var sut: Stack<Int>!

    override func setUpWithError() throws {
        sut = Stack<Int>()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
