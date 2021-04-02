//
//  DecimalNumberTests.swift
//  CalculatorTests
//
//  Created by 배은서 on 2021/04/01.
//

import XCTest
@testable import Calculator

class DecimalNumberTests: XCTestCase {
    var sut: DecimalNumber!

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_zero() {
        sut = DecimalNumber.zero
        XCTAssertEqual(sut.value, 0)
        XCTAssertEqual(sut.text, "0")
    }
    
    func test_min() {
        XCTAssertEqual(DecimalNumber.min, -999999999.0)
    }
    
    func test_max() {
        XCTAssertEqual(DecimalNumber.max, 999999999.0)
    }
    
    func test_정상적인_양수_들어오면_초기화_성공() {
        sut = DecimalNumber("123.123")
        XCTAssertEqual(sut.value, 123.123)
        XCTAssertEqual(sut.text, "123.123")
    }
    
    func test_정상적인_음수_들어오면_초기화_성공() {
        sut = DecimalNumber("-123.123")
        XCTAssertEqual(sut.value, -123.123)
        XCTAssertEqual(sut.text, "-123.123")
    }
    
    func test_Double로_바꿀수_없는_문자열이_들어오면_초기화_실패() {
        sut = DecimalNumber("가나다")
        XCTAssertEqual(sut, nil)
    }
    
    func test_문자열로_들어온_양수값이_자릿수초과면_실패() {
        sut = DecimalNumber("1234.5678798")
        XCTAssertEqual(sut, nil)
    }
    
    func test_문자열로_들어온_실수_음수값이_자릿수초과면_실패() {
        sut = DecimalNumber("-1234.567898")
        XCTAssertEqual(sut, nil)
    }
    
    func test_문자열로_들어온_실수가_소수부에_0만_있다면_제거() {
        sut = DecimalNumber("1.0")
        XCTAssertEqual(sut.value, 1)
        XCTAssertEqual(sut.text, "1")
    }
    
    func test_자릿수_초과된_양수가_들어오면_소수부_자르고_반올림() {
        sut = DecimalNumber(123.4567898)
        XCTAssertEqual(sut.value, 123.45679)
    }
    
    func test_자릿수_초과된_음수가_들어오면_소수부_자르고_반올림() {
        sut = DecimalNumber(-123.4567898)
        XCTAssertEqual(sut.value, -123.45679)
    }
    
    func test_소수부가_0인_실수가_들어오면_소수부_자르기() {
        sut = DecimalNumber(1234.0)
        XCTAssertEqual(sut.value, 1234)
        XCTAssertEqual(sut.text, "1234")
    }
    
    func test_오버플로우_값이_들어오면_0으로_초기화() {
        sut = DecimalNumber(DecimalNumber.max + 1)
        XCTAssertEqual(sut.value, 0)
    }
    
    func test_언더플로우_값이_들어오면_0으로_초기화() {
        sut = DecimalNumber(DecimalNumber.min - 1)
        XCTAssertEqual(sut.value, 0)
    }

}
