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
    
    func test_zero는_0이다() {
        sut = BinaryNumber.zero
        XCTAssertEqual(sut?.value, 0)
        XCTAssertEqual(sut?.text, "0")
    }
    
    func test_max는_255이다() {
        XCTAssertEqual(BinaryNumber.max, 255)
    }
    
    func test_min는_마이너스_256이다() {
        XCTAssertEqual(BinaryNumber.min, -256)
    }
    
    func test_unsignedMax는_511이다() {
        XCTAssertEqual(BinaryNumber.unsignedMax, 511)
    }

    func test_잘못된_문자열로_초기화하면_실패한다() {
        sut = BinaryNumber("2")
        XCTAssertEqual(sut, nil)
    }
    
    func test_최대문자길이보다_긴_문자열로_초기화하면_실패한다() {
        sut = BinaryNumber("1011111111")
        XCTAssertEqual(sut, nil)
    }
    
    func test_첫번째문자가_1이고_최대문자길이인_문자열로_초기화하면_음수이다() {
        sut = BinaryNumber("111111111")
        XCTAssertLessThan(sut.value, 0)
    }
    
    func test_음수인_문자열이_정상적으로_value와_text로_저장된다() {
        sut = BinaryNumber("100000000")
        XCTAssertEqual(sut?.value, -256)
        XCTAssertEqual(sut?.text, "100000000")
    }
    
    func test_0인_문자열로_초기화하면_zero이다() {
        sut = BinaryNumber("0")
        XCTAssertEqual(sut, BinaryNumber.zero)
    }
    
    func test_양수인_문자열이_정상적으로_value와_text로_저장된다() {
        sut = BinaryNumber("11111111")
        XCTAssertEqual(sut?.value, 0b11111111)
        XCTAssertEqual(sut?.text, "11111111")
    }
    
    func test_0으로_시작하는_문자열로_초기화하면_쓸모없는_0을_잘라준다() {
        sut = BinaryNumber("011111111")
        XCTAssertEqual(sut?.value, 0b11111111)
        XCTAssertEqual(sut?.text, "11111111")
    }
    
    func test_음수인_정수로_초기화하면_최대자릿수_기준으로_표현한다() {
        sut = BinaryNumber(-1)
        XCTAssertEqual(sut.value, -1)
        XCTAssertEqual(sut.text, "111111111")
    }
    
    func test_최솟값에서_1뺀값인_정수로_초기화하면_0이다() {
        sut = BinaryNumber(BinaryNumber.min - 1)
        XCTAssertEqual(sut, BinaryNumber.zero)
    }
    
    func test_최솟값보다_작은_정수로_초기화하면_최솟값에서_1뺀값과_나머지연산을_하여_표현한다() {
        sut = BinaryNumber(-365)
        XCTAssertEqual(sut, BinaryNumber(-365 % (BinaryNumber.min - 1)))
    }
    
    func test_0인_정수로_초기화하면_zero이다() {
        sut = BinaryNumber(0)
        XCTAssertEqual(sut, BinaryNumber.zero)
    }
    
    func test_양수인_정수가_정상적으로_value와_text로_저장된다() {
        sut = BinaryNumber(32)
        XCTAssertEqual(sut.value, 32)
        XCTAssertEqual(sut.text, "100000")
    }
    
    func test_최댓값에서_1더한값으로_초기화하면_0이다() {
        sut = BinaryNumber(BinaryNumber.max + 1)
        XCTAssertEqual(sut, BinaryNumber.zero)
    }
    
    func test_최댓값보다_큰_정수로_초기화하면_최댓값에서_1더한값과_나머지연산을_하여_표현한다() {
        sut = BinaryNumber(365)
        XCTAssertEqual(sut, BinaryNumber(365 % (BinaryNumber.max + 1)))
    }
}
