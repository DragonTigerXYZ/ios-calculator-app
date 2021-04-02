//
//  InfixOperatorTests.swift
//  CalculatorTests
//
//  Created by 배은서 on 2021/04/01.
//

import XCTest
@testable import Calculator

class InfixOperatorTests: XCTestCase {
    var sut: BinaryInfixOpeartor!
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
        
    func test_해당_연산자의_우선순위가_더_높다면_true를_반환한다() {
        sut = BinaryInfixOpeartor(rawValue: ">>")
        XCTAssertTrue(sut.isPrecedence(over: BinaryInfixOpeartor.bitwiseAND))
    }
    
    func test_해당_연산자의_우선순위가_더_작다면_false를_반환한다() {
        sut = BinaryInfixOpeartor(rawValue: "^")
        XCTAssertFalse(sut.isPrecedence(over: BinaryInfixOpeartor.bitwiseAND))
    }

    func test_해당_연산자의_우선순위가_같다면_false를_반환한다() {
        sut = BinaryInfixOpeartor(rawValue: "^")
        XCTAssertFalse(sut.isPrecedence(over: BinaryInfixOpeartor.bitwiseXOR))
    }
}
