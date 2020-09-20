//
//  MultiCalculatorViewControllerTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/31.
//

import XCTest
import Shared

class MultiCalculatorViewControllerTests: XCTestCase {
    
    override func tearDown() {
        super.tearDown()
        
//        XCUIDevice.shared.orientation = .portrait
    }
    
    func createViewController() -> MultiCalculatorViewController {
        let viewController = MultiCalculatorViewController(dependency: ())
        viewController.viewDidLoad()
        return viewController
    }
    
    func testViewDidLoad() {
        let viewController = createViewController()
        
        XCTAssertEqual(viewController.view.backgroundColor, UIColor.systemBackground)
    }
    
    func testContainerView() {
        let viewController = createViewController()
        
        XCTAssertEqual(viewController.containerView.distribution, UIStackView.Distribution.fillEqually)
    }
    
//    func testLandScape() {
//        XCUIDevice.shared.orientation = .landscapeLeft
//
//        let viewController = createViewController()
//
//        XCTAssertEqual(viewController.containerView.subviews.count, 3)
//    }
}
