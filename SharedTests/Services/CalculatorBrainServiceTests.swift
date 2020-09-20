//
//  CalculatorBrainServiceTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/31.
//

import XCTest
import Shared

class CalculatorBrainServiceTests: XCTestCase {
    var service = CalculatorBrainService.init()
    
    func testOperations() {
        XCTAssertNotNil(service.operations["AC"])
        XCTAssertNotNil(service.operations["%"])
        XCTAssertNotNil(service.operations["±"])
        XCTAssertNotNil(service.operations["×"])
        XCTAssertNotNil(service.operations["÷"])
        XCTAssertNotNil(service.operations["+"])
        XCTAssertNotNil(service.operations["−"])
        XCTAssertNotNil(service.operations["="])
    }
    
    func testPerformOperation() {
        service.performOperation("AC")
        XCTAssertEqual(service.accumulator, 0)
        XCTAssertNil(service.pendingBinaryOperation)
        
        service = .init()
        service.setOperand(12345)
        service.performOperation("%")
        XCTAssertEqual(service.accumulator, 123.45)
        
        service = .init()
        service.setOperand(12345)
        service.performOperation("±")
        XCTAssertEqual(service.accumulator, -12345)
        
        service = .init()
        service.setOperand(-12345)
        service.performOperation("±")
        XCTAssertEqual(service.accumulator, 12345)
        
        service = .init()
        service.setOperand(123)
        XCTAssertEqual(service.accumulator, 123)
        service.performOperation("×")
        XCTAssertNil(service.accumulator)
        service.setOperand(456)
        XCTAssertEqual(service.accumulator, 456)
        service.performOperation("=")
        XCTAssertEqual(service.accumulator, 56088.0)
        XCTAssertNil(service.pendingBinaryOperation)
        
        service = .init()
        service.setOperand(300)
        XCTAssertEqual(service.accumulator, 300)
        service.performOperation("÷")
        XCTAssertNil(service.accumulator)
        service.setOperand(200)
        XCTAssertEqual(service.accumulator, 200)
        service.performOperation("=")
        XCTAssertEqual(service.accumulator, 1.5)
        XCTAssertNil(service.pendingBinaryOperation)
        
        service = .init()
        service.setOperand(123)
        XCTAssertEqual(service.accumulator, 123)
        service.performOperation("+")
        XCTAssertNil(service.accumulator)
        service.setOperand(456)
        XCTAssertEqual(service.accumulator, 456)
        service.performOperation("=")
        XCTAssertEqual(service.accumulator, 579.0)
        XCTAssertNil(service.pendingBinaryOperation)
        
        service = .init()
        service.setOperand(123)
        XCTAssertEqual(service.accumulator, 123)
        service.performOperation("−")
        XCTAssertNil(service.accumulator)
        service.setOperand(456)
        XCTAssertEqual(service.accumulator, 456)
        service.performOperation("=")
        XCTAssertEqual(service.accumulator, -333.0)
        XCTAssertNil(service.pendingBinaryOperation)
        
        service = .init()
        service.performOperation("error")
    }
}
