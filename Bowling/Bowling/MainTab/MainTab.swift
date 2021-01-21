//
//  MainTab.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 0
    }
    
    // MARK: - Configusres
    private func configureTabBar() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .orange

        let newGameTab = barTabView(view: NewGameVC(), image: "bowling")
        let historyTab = barTabView(view: GameHistoryVC(), image: "history")
        
        viewControllers = [newGameTab, historyTab]
    }
    
    // MARK:- Helpers
    private func barTabView(view: UIViewController, image: String, width: CGFloat = 30, height: CGFloat = 30) -> UINavigationController {
        let tabView = UINavigationController(rootViewController: view)
        tabView.tabBarItem.image = UIImage(named: image)?.scaledDown(into: CGSize(width: width, height: height))
        tabView.navigationBar.isHidden = true
        return tabView
    }
    
}
