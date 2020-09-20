//
//  ContainerView.swift
//  MultiCalculator
//
//  Created by 築山朋紀 on 2020/07/30.
//

import UIKit

public class ContainerView: UIStackView {
    public final class Container<Content, Parent> where Parent: Injectable, Parent: UIViewController, Content: Injectable, Content: UIViewController {
        weak var base: ContainerView?
        weak var parentViewController: Parent?
        var contents: [Content] = []
        init(base: ContainerView, parentViewController: Parent) {
            self.base = base
            self.parentViewController = parentViewController
        }
    }
    public func makeContainer<Content, Parent>(for type: Content.Type, parentViewController: Parent) -> Container<Content, Parent> where Content: UIViewController, Content: Injectable, Parent: UIViewController, Parent: Injectable {
        .init(base: self, parentViewController: parentViewController)
    }
    public func insertArrangedViewController(_ viewController: UIViewController, parentViewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        parentViewController.addChild(viewController)
        addArrangedSubview(viewController.view)
        viewController.didMove(toParent: parentViewController)
    }
    public func removeArrangedViewController(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        removeArrangedSubview(viewController.view)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
