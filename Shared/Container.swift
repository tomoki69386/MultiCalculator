//
//  Container.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/30.
//

import UIKit

extension ContainerView.Container {
    public func dependency(_ dependency: Content.Dependency?) {
        dependencies([dependency].compactMap { $0 })
    }
    public func dependencies(_ dependencies: [Content.Dependency]) {
        guard let base = base, let parentViewController = parentViewController else { return }
        if dependencies.count < contents.count {
            let range = dependencies.count..<contents.count
            contents[range].forEach({ viewController in
                base.removeArrangedViewController(viewController)
            })
            contents.removeSubrange(range)
        }
        if contents.count < dependencies.count {
            dependencies[contents.count..<dependencies.count].forEach({ dependency in
                let viewController = Content.init(dependency: dependency)
                base.insertArrangedViewController(viewController, parentViewController: parentViewController)
                contents.append(viewController)
            })
        }
    }
}
