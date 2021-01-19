//
//  MainTab.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    // MARK:- Properties
    private let viewModel = MainTabVM()
    
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

        let newGameTab = viewModel.barTabView(view: NewGameVC(), image: "bowling")
        let historyTab = viewModel.barTabView(view: GameHistoryVC(), image: "history")
//        let orderTab =
//        let myPageTab = viewModel.barTabView(view: MyPageVC(), image: "setting")
//
        viewControllers = [newGameTab, historyTab]
    }
    
}
