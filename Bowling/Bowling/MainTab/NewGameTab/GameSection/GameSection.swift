//
//  GameSection.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class GameSection: UIViewController {
    let gameCVC = GameCVC()
    let trialCVC = TrialCVC()
    let nameLabel = UILabel()
    
    init(name: String) {
        super.init(nibName: nil, bundle: nil)
        nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(nameLabel)
        nameLabel.font = .notoBold(size: 20 * ratio)
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(30 * ratio)
            make.top.left.right.equalToSuperview()
        }
        
        view.addSubview(gameCVC.collectionView)
        gameCVC.collectionView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(150 * ratio + 10)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
}
