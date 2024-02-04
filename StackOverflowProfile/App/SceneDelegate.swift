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
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }

    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createSearchNC(), createFavoritesNC()]

        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().backgroundColor = .secondarySystemGroupedBackground

        return tabBar
    }

    func createSearchNC() -> UINavigationController {
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        return searchVC
    }

    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        return UINavigationController(rootViewController: favoritesVC)
    }

    func sceneDidDisconnect(_: UIScene) {}

    func sceneDidBecomeActive(_: UIScene) {}

    func sceneWillResignActive(_: UIScene) {}

    func sceneWillEnterForeground(_: UIScene) {}

    func sceneDidEnterBackground(_: UIScene) {}
}
