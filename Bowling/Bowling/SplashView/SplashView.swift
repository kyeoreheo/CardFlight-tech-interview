//
//  SplashView.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit
import SnapKit

class SplashView: UIViewController {
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        applyGlobalVariables()
        configureUI()
        
        let myGame = Game()

        myGame.addPoint(of: .strike)
        myGame.addPoint(of: .seven)
        myGame.addPoint(of: .spare)
        myGame.addPoint(of: .nine)
        myGame.addPoint(of: .miss)
        myGame.addPoint(of: .strike)
        myGame.addPoint(of: .miss)
        myGame.addPoint(of: .eight)
        myGame.addPoint(of: .eight)
        myGame.addPoint(of: .spare)
        myGame.addPoint(of: .miss)
        myGame.addPoint(of: .six)
        myGame.addPoint(of: .strike)
        myGame.addPoint(of: .strike)
        myGame.addPoint(of: .strike)
        myGame.addPoint(of: .eight)
        myGame.addPoint(of: .one)

        myGame.boardInfo()
    }
    
    private func configureUI() {
        view.backgroundColor = .orange
        
        view.addSubview(label)
        label.text = "CardFlight Tech Challenge"
        label.textColor = .white
//        label.font = .gothicReg(size: 12)
        label.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
    }
    
    private func presentMainTabBar() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let navigation = UINavigationController(rootViewController: MainTabBar())
            navigation.modalPresentationStyle = .fullScreen
            navigation.navigationBar.isHidden = true
            strongSelf.present(navigation, animated: false, completion: nil)
        }
    }
    
    // MARK:- Helpers
    private func applyGlobalVariables() {
        let heightRatio: CGFloat = view.frame.height / 812.0
        ratio = heightRatio < 1 ? 1:heightRatio
        isBigPhone = view.frame.height > 750.0
        topSafeMargin = ( UIApplication.shared.windows.first{$0.isKeyWindow}?.safeAreaInsets.top ?? 0) as CGFloat
        phoneWidth = view.frame.width
    }
}
