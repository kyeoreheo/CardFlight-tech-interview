//
//  HistoryVC.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class GameHistoryVC: UIViewController {
    // MARK:- View components
    private let totalNumberOfGameLabel = UILabel()
    private let gameHistoryCVC = GameHistoryCVC()
    // MARK:- Properties
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gameHistoryCVC.histories = Storage.shared.histories
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .orange
        
        view.addSubview(totalNumberOfGameLabel)
        totalNumberOfGameLabel.text = "Total number of games: 12"
        totalNumberOfGameLabel.textColor = .gray8
        totalNumberOfGameLabel.font = .notoBold(size: 16 * ratio)
        totalNumberOfGameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(gameHistoryCVC.collectionView)
        gameHistoryCVC.collectionView.snp.makeConstraints { make in
            make.top.equalTo(totalNumberOfGameLabel.snp.bottom).offset(4)
            make.width.equalTo(view.frame.width - 32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
