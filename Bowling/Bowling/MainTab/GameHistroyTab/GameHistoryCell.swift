//
//  GameHistoryCell.swift
//  Bowling
//
//  Created by Kyo on 1/20/21.
//

import UIKit

class GameHistoryCell: UICollectionViewCell {
    // MARK:- View components
    let trialLabel = UILabel()
    
    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configureUI() {
        addSubview(trialLabel)
        trialLabel.text = "HI"
        trialLabel.layer.borderWidth = 2
        trialLabel.layer.borderColor = UIColor.gray3.cgColor
        trialLabel.layer.cornerRadius = 5
        trialLabel.font = .notoBold(size: 30 * ratio)
        trialLabel.textColor = .gray6
        trialLabel.textAlignment = .center
        trialLabel.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

    }

}
