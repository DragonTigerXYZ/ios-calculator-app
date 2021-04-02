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
    
    func test_빈_스택의_count는_0이다() {
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_빈_스택의_isEmpty는_true이다() {
        XCTAssert(sut.isEmpty)
    }
    
    func test_빈_스택에서_peek을_하면_nil을_반환한다() {
        XCTAssertEqual(sut.peek(), nil)
    }
    
    func test_스택에_아이템을_push하면_내부배열에_추가된다() {
        let item: Int = 3
        
        sut.push(item)
        XCTAssertEqual(sut.peek(), item)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_비어있지_않은_스택의_isNotEmpty는_true이다() {
        sut.push(3)
        XCTAssert(sut.isNotEmpty)
    }
    
    func test_스택에서_peek을_하면_가장_나중에_넣은_요소를_보여준다() {
        let item1: Int = 3
        let item2: Int = 4
        
        sut.push(item1)
        sut.push(item2)
        XCTAssertEqual(sut.peek(), item2)
    }
    
    func test_빈_스택에서_pop을_하면_nil을_반환한다() {
        XCTAssertEqual(sut.pop(), nil)
    }
    
    func test_스택에서_pop을_하면_가장_나중에_넣은_요소를_뽑아준다() {
        let item1: Int = 3
        let item2: Int = 4
        
        sut.push(item1)
        sut.push(item2)
        XCTAssertEqual(sut.pop(), item2)
        XCTAssertEqual(sut.peek(), item1)
        XCTAssertEqual(sut.count, 1)
    }
    
    func test_스택을_clear하면_모든_아이템을_제거한다() {
        let item1: Int = 3
        let item2: Int = 4
        
        sut.push(item1)
        sut.push(item2)
        sut.clear()
        XCTAssertEqual(sut.count, 0)
    }
}
