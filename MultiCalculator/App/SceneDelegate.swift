//
//  SceneDelegate.swift
//  Template
//
//  Created by 築山朋紀 on 2020/07/16.
//  Copyright © 2020 築山朋紀. All rights reserved.
//

import UIKit
import Shared

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = .init(windowScene: windowScene)
        let dependency = RootViewController.Dependency(
            rootViewController: MultiCalculatorViewController.init(dependency: ()))
        window?.rootViewController = RootViewController(dependency: dependency)
        window?.makeKeyAndVisible()
        
        #if targetEnvironment(macCatalyst)
        window?.windowScene?.titlebar?.titleVisibility = .hidden
        #endif
    }
}
