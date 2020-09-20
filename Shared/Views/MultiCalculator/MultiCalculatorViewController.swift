//
//  MultiCalculatorViewController.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/30.
//

import UIKit

public class MultiCalculatorViewController: UIViewController, Injectable {
    
    public typealias Dependency = Void
    
    @IBOutlet public var containerView: ContainerView!
    
    lazy var calculatorContainer = self.containerView.makeContainer(
        for: CalculatorViewController.self,
        parentViewController: self)
    
    public required init(dependency: Void) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        containerView.distribution = .fillEqually
        
        orientationDidChanged()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChanged),
            name: UIDevice.orientationDidChangeNotification,
            object: nil
        )
    }
    
    @objc func orientationDidChanged() {
        let orientation = UIDevice.current.orientation
        // 両方がfalseの場合は更新を行わない
        if orientation.isPortrait == false && orientation.isLandscape == false {
            return
        }
        var dependencies: [CalculatorViewController.Dependency] = [.init(isPortrait: orientation.isPortrait)]
        if !orientation.isPortrait {
            dependencies.append(.init(isPortrait: orientation.isPortrait))
            dependencies.append(.init(isPortrait: orientation.isPortrait))
        }
        calculatorContainer.dependencies([])
        calculatorContainer.dependencies(dependencies)
    }
}
