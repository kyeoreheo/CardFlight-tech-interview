//
//  GameSection.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class GameSection: UIViewController {
    lazy var gameCVC = GameCVC(color: color)
    let trialCVC = TrialCVC()
    let nameLabel = UILabel()
    let cumulativeScore = UILabel()
    let name: String
    let color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
        nameLabel.text = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    
    private func configure() {
        view.backgroundColor = .white
        gameCVC.cumulativeScore = cumulativeScore
        trialCVC.delegate = self
        trialCVC.game = gameCVC.game
    }
    
    private func configureUI() {
        view.addSubview(nameLabel)
        nameLabel.textColor = .black
        nameLabel.font = .notoBold(size: 25 * ratio)
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(35 * ratio)
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(cumulativeScore)
        cumulativeScore.text = "SCORE: 0"
        cumulativeScore.textAlignment = .right
        cumulativeScore.textColor = .gray7
        cumulativeScore.font = .notoBold(size: 20 * ratio)
        cumulativeScore.snp.makeConstraints { make in
            make.height.equalTo(35 * ratio)
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(gameCVC.collectionView)
        gameCVC.collectionView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(150 * ratio + 10)
            make.left.right.equalToSuperview()
        }
        
        view.addSubview(trialCVC.collectionView)
        trialCVC.collectionView.snp.makeConstraints { make in
            make.top.equalTo(gameCVC.collectionView.snp.bottom).offset(4)
            make.height.equalTo(40 * ratio)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
}

extension GameSection: TrialCVCDelegate {
    func trialCellTapped(index: Int, point: Point) {
        gameCVC.addPoint(of: point)
    }
}
