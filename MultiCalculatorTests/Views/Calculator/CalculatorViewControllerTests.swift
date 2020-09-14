//
//  CalculatorViewControllerTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/31.
//

import XCTest
@testable import MultiCalculator

class CalculatorViewControllerTests: XCTestCase {
    func createViewController(isPortrait: Bool) -> CalculatorViewController {
        let viewController = CalculatorViewController(dependency: .init(isPortrait: isPortrait))
        viewController.viewDidLoad()
        return viewController
    }
    
    func testCalculator() {
        let viewController = createViewController(isPortrait: true)
        
        viewController.calculator("1")
        XCTAssertEqual(viewController.resultLabel.text, "1")
        
        viewController.calculator("+")
        XCTAssertEqual(viewController.resultLabel.text, "1")
        
        viewController.calculator("2")
        XCTAssertEqual(viewController.resultLabel.text, "2")
        
        viewController.calculator("=")
        XCTAssertEqual(viewController.resultLabel.text, "3.0")
        
        viewController.calculator("AC")
        XCTAssertEqual(viewController.resultLabel.text, "0.0")
        
        viewController.calculator("2")
        XCTAssertEqual(viewController.resultLabel.text, "2")
        
        viewController.calculator("2")
        XCTAssertEqual(viewController.resultLabel.text, "22")
        
        viewController.calculator("×")
        XCTAssertEqual(viewController.resultLabel.text, "22")
        
        viewController.calculator("3")
        XCTAssertEqual(viewController.resultLabel.text, "3")
        
        viewController.calculator("=")
        XCTAssertEqual(viewController.resultLabel.text, "66.0")
    }
    
    func testTappedButton() {
        let viewController = createViewController(isPortrait: true)
        
        viewController.tappedNumber(.init(type: .custom))
        
        let button = MCButton(type: .custom)
        button.setTitle("100", for: .normal)
        viewController.tappedNumber(button)
        XCTAssertEqual(viewController.resultLabel.text, "100")
    }
    
    func testViewDidLoad() {
        XCTAssertEqual(createViewController(isPortrait: true).stackViews.count, 6)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews.count, 6)
        
        XCTAssertEqual(createViewController(isPortrait: true).stackViews[0].spacing, 20.0)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews[0].spacing, 4.0)
        
        XCTAssertEqual(createViewController(isPortrait: true).stackViews[1].spacing, 20.0)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews[1].spacing, 4.0)
        
        XCTAssertEqual(createViewController(isPortrait: true).stackViews[2].spacing, 20.0)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews[2].spacing, 4.0)
        
        XCTAssertEqual(createViewController(isPortrait: true).stackViews[3].spacing, 20.0)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews[3].spacing, 4.0)
        
        XCTAssertEqual(createViewController(isPortrait: true).stackViews[4].spacing, 20.0)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews[4].spacing, 4.0)
        
        XCTAssertEqual(createViewController(isPortrait: true).stackViews[5].spacing, 20.0)
        XCTAssertEqual(createViewController(isPortrait: false).stackViews[5].spacing, 4.0)
    }
    
    func testColor() {
        let viewController = createViewController(isPortrait: true)
        XCTAssertEqual(viewController.view.backgroundColor, UIColor.systemBackground)
    }
}
