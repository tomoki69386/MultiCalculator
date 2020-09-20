//
//  MCButtonTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/26.
//

import XCTest
import Shared

class MCButtonTests: XCTestCase {
    
    let mcButton: MCButton = {
        let button = MCButton(type: .custom)
        let rect = CGRect(origin: .init(), size: .init(width: 50, height: 50))
        button.frame = rect
        button.draw(rect)
        return button
    }()
    
    func testTitleFont() {
        XCTAssertEqual(mcButton.titleLabel?.font.pointSize, 28.0)
    }
    
    func testTitleColor() {
        XCTAssertEqual(mcButton.titleLabel?.textColor, UIColor.label)
    }
    
    func testClipsToBounds() {
        XCTAssertTrue(mcButton.clipsToBounds)
    }
    
    func testCornerRadius() {
        mcButton.layoutIfNeeded()
        XCTAssertEqual(mcButton.layer.cornerRadius, 25)
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
