//
//  LanidingViewController.swift
//  StackOverflowProfile
//
//  Created by Md. Asadul Islam on 4/2/24.
//

import UIKit

class LanidingViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createSearchNC(), createFavoritesNC()]

        configureTabBar()
        configureNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func createSearchNC() -> UINavigationController {
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        return searchVC
    }

    private func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        return UINavigationController(rootViewController: favoritesVC)
    }

    private func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.selectionIndicatorTintColor = .systemGreen
        appearance.backgroundColor = .secondarySystemBackground

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    private func configureNavigationBar() {
        let apprearance = UINavigationBarAppearance()
        apprearance.backgroundColor = .secondarySystemBackground

        UINavigationBar.appearance().standardAppearance = apprearance
        UINavigationBar.appearance().compactAppearance = apprearance
        UINavigationBar.appearance().scrollEdgeAppearance = apprearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = apprearance
    }
}

#Preview {
    let landingVC = LanidingViewController()
    return landingVC
}
