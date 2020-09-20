//
//  RootViewControllerTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/25.
//

import XCTest
import Shared

class RootViewControllerTests: XCTestCase {
    class MockViewController: UIViewController { }
    
    func testCurrentViewController() {
        let mockViewController = MockViewController()
        let dependency: RootViewController.Dependency = .init(rootViewController: mockViewController)
        let rootViewController = RootViewController(dependency: dependency)
        
        XCTAssertEqual(rootViewController.view.subviews.first, mockViewController.view)
        XCTAssertEqual(rootViewController.view.subviews.count, 1)
    }
}
