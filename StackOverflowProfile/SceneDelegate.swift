//
//  SceneDelegate.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_: UIScene) {
    }

    func sceneDidBecomeActive(_: UIScene) {
    }

    func sceneWillResignActive(_: UIScene) {
    }

    func sceneWillEnterForeground(_: UIScene) {
    }

    func sceneDidEnterBackground(_: UIScene) {

    }
}
