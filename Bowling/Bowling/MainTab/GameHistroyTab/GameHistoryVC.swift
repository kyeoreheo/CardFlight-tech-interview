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
    private let emptyHistoryImage = UIImageView()
    private let gameHistoryCVC = GameHistoryCVC()

    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyHistoryImage.isHidden = true
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gameHistoryCVC.histories = Storage.shared.histories
        if Storage.shared.histories.count > 0 {
            totalNumberOfGameLabel.text = "Total number of games: \(Storage.shared.histories.count)"
            emptyHistoryImage.isHidden = true
            
        } else {
            totalNumberOfGameLabel.text = "There are no histories to show. Play Games!"
            emptyHistoryImage.isHidden = false
        }

    }
    
    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(totalNumberOfGameLabel)
        totalNumberOfGameLabel.textColor = .gray8
        totalNumberOfGameLabel.font = .notoBold(size: 16 * ratio)
        totalNumberOfGameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(20 * ratio)
        }
        
        view.addSubview(gameHistoryCVC.view)
        gameHistoryCVC.view.snp.makeConstraints { make in
            make.top.equalTo(totalNumberOfGameLabel.snp.bottom).offset(4)
            make.width.equalTo(view.frame.width - 32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        view.addSubview(emptyHistoryImage)
        emptyHistoryImage.image = UIImage(named: "emptyHistory")
        emptyHistoryImage.contentMode = .scaleAspectFit
        emptyHistoryImage.snp.makeConstraints { make in
            make.top.equalTo(totalNumberOfGameLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
}
