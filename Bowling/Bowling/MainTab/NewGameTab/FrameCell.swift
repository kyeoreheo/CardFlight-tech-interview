//
//  GameCell.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

protocol FrameCellDelegate: class {
    func firstTrialButton()
    func secondTrailButton()
}

class FrameCell: UICollectionViewCell {
    // MARK:- View components
    let frameLabel = UILabel()
    let stackView = UIStackView()
    let firstTrialLabel = UILabel()
    let secondTrialLabel = UILabel()
    let thirdTrialLabel = UILabel()

    let cumulativePointLabel = UILabel()
    
    // MARK:- Properties
    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureUI()
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configureUI() {
        addSubview(frameLabel)
        frameLabel.textAlignment = .center
        frameLabel.backgroundColor = .blue
        frameLabel.textColor = .white
        frameLabel.font = .notoBold(size: 20 * ratio)
        frameLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(30 * ratio)
        }
        
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.clipsToBounds = true
        stackView.snp.makeConstraints { make in
            make.top.equalTo(frameLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(50 * ratio)
        }

    }
    
    private func configureLabels() {
        stackView.addArrangedSubview(firstTrialLabel)
        firstTrialLabel.text = "X"
        firstTrialLabel.layer.borderWidth = 1
        firstTrialLabel.layer.borderColor = UIColor.gray3.cgColor
        firstTrialLabel.textAlignment = .center
        firstTrialLabel.textColor = .black
        firstTrialLabel.font = .notoReg(size: 30 * ratio)
        firstTrialLabel.snp.makeConstraints { make in
            make.width.height.equalTo(40 * ratio)
        }
        
        stackView.addArrangedSubview(secondTrialLabel)
        secondTrialLabel.text = "9"
        secondTrialLabel.layer.borderWidth = 1
        secondTrialLabel.layer.borderColor = UIColor.gray3.cgColor
        secondTrialLabel.textAlignment = .center
        secondTrialLabel.textColor = .black
        secondTrialLabel.font = .notoReg(size: 30 * ratio)
        secondTrialLabel.snp.makeConstraints { make in
            make.height.width.equalTo(40 * ratio)
        }
    }
    
    
}
