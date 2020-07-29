//
//  MCButtonTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/26.
//

import XCTest
@testable import MultiCalculator

class MCButtonTests: XCTestCase {
    
    let mcButton: MCButton = {
        let button = MCButton(type: .custom)
        let rect = CGRect(origin: .init(), size: .init(width: 50, height: 50))
        button.frame = rect
        button.draw(rect)
        return button
    }()
    
    func testTitleFont() {
        XCTAssertEqual(mcButton.titleLabel?.font.fontName, ".SFUI-Bold")
        XCTAssertEqual(mcButton.titleLabel?.font.pointSize, 28.0)
    }
    
    func testTitleColor() {
        XCTAssertEqual(mcButton.titleLabel?.textColor, UIColor.label)
    }
    
    func testClipsToBounds() {
        XCTAssertTrue(mcButton.clipsToBounds)
    }
    
    func testCornerRadius() {
        XCTAssertEqual(mcButton.layer.cornerRadius, 25)
    }
    
    func testBorderColor() {
        XCTAssertEqual(mcButton.layer.borderColor, UIColor.label.cgColor)
    }
    
    func testBorderWidth() {
        XCTAssertEqual(mcButton.layer.borderWidth, 1)
    }
    
    func testBackgroundColor() {
        XCTAssertEqual(mcButton.backgroundColor, UIColor.darkGray)
    }
    
    func testIsHighlighted() {
        mcButton.isHighlighted = false
        XCTAssertEqual(mcButton.backgroundColor, UIColor.darkGray)
        
        mcButton.isHighlighted = true
        XCTAssertEqual(mcButton.backgroundColor, UIColor.lightGray)
    }
}
