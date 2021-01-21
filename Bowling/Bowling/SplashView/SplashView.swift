//
//  SplashView.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit
import SnapKit

class SplashView: UIViewController {
    // MARK:- ViewComponents
    private let label = UILabel()

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobalVariables()
        configureUI()
        presentMainTabBar()
    }
    
    // MARK: - Configusres
    private func configureUI() {
        view.backgroundColor = .orange
        view.addSubview(label)
        label.text = "CardFlight Tech Challenge"
        label.textColor = .white
        label.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
    }
    
    // MARK:- Helpers
    private func presentMainTabBar() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let navigation = UINavigationController(rootViewController: MainTabBar())
            navigation.modalPresentationStyle = .fullScreen
            navigation.navigationBar.isHidden = true
            strongSelf.present(navigation, animated: false, completion: nil)
        }
    }
    
    private func applyGlobalVariables() {
        let heightRatio: CGFloat = view.frame.height / 812.0
        ratio = heightRatio < 1 ? 1:heightRatio
        isBigPhone = view.frame.height > 750.0
        topSafeMargin = ( UIApplication.shared.windows.first{$0.isKeyWindow}?.safeAreaInsets.top ?? 0) as CGFloat
        phoneWidth = view.frame.width
    }
    
}
