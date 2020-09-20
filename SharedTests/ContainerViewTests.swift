//
//  ContainerViewTests.swift
//  MultiCalculatorTests
//
//  Created by 築山朋紀 on 2020/07/30.
//

import XCTest
import Shared

class ContainerViewTests: XCTestCase {
    class FirstViewController: UIViewController, Injectable {
        
        typealias Dependency = String
        let dependency: Dependency
        
        let containerView = ContainerView()
        
        lazy var container = containerView.makeContainer(
            for: SecondViewController.self,
            parentViewController: self)
        
        required init(dependency: Dependency) {
            self.dependency = dependency
            super.init(nibName: nil, bundle: nil)
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(containerView)
            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: view.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
    }
    class SecondViewController: UIViewController, Injectable {
        
        typealias Dependency = Int
        let dependency: Dependency
        
        required init(dependency: Dependency) {
            self.dependency = dependency
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
    }
    
    func testContainerViewLayout() {
        let viewController = FirstViewController.init(dependency: "")
        viewController.viewDidLoad()
        
        XCTAssertEqual(viewController.containerView.subviews.count, 0)
        
        viewController.container.dependency(1)
        
        XCTAssertEqual(viewController.containerView.subviews.count, 1)
        
        viewController.container.dependency(nil)
        
        XCTAssertEqual(viewController.containerView.subviews.count, 0)
        
        viewController.container.dependencies([1, 2, 3])
        
        XCTAssertEqual(viewController.containerView.subviews.count, 3)
        
        viewController.container.dependencies([])
        
        XCTAssertEqual(viewController.containerView.subviews.count, 0)
    }
}
