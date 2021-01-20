//
//  GameCell.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class FrameCell: UICollectionViewCell {
    // MARK:- View components
    let frameLabel = UILabel()
    let stackView = UIStackView()
    let firstTrialLabel = UILabel()
    let secondTrialLabel = UILabel()
    let thirdTrialLabel = UILabel()
    let cumulativePointLabel = UILabel()
    let cover = UIView()
    
    // MARK:- Properties
//    weak var delegate: FrameCellDelegate?
    public var parent: GameCVC?
    public var index = 0

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        cover.isHidden = true
        configureUI()
        configureLabels()
        thirdTrialLabel.isHidden = true
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

        addSubview(cumulativePointLabel)
        cumulativePointLabel.textColor = .black
        cumulativePointLabel.layer.borderWidth = 1
        cumulativePointLabel.layer.borderColor = UIColor.gray3.cgColor
        cumulativePointLabel.font = .notoBold(size: 40 * ratio)
        cumulativePointLabel.textAlignment = .center
        cumulativePointLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        addSubview(cover)
        cover.backgroundColor = .clear
        cover.layer.borderWidth = 4
        cover.layer.borderColor = UIColor.orange.cgColor
        cover.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    private func configureLabels() {
        stackView.addArrangedSubview(firstTrialLabel)
        firstTrialLabel.layer.borderWidth = 1
        firstTrialLabel.layer.borderColor = UIColor.gray3.cgColor
        firstTrialLabel.textAlignment = .center
        firstTrialLabel.textColor = .black
        firstTrialLabel.font = .notoReg(size: 30 * ratio)
        
        stackView.addArrangedSubview(secondTrialLabel)
        secondTrialLabel.layer.borderWidth = 1
        secondTrialLabel.layer.borderColor = UIColor.gray3.cgColor
        secondTrialLabel.textAlignment = .center
        secondTrialLabel.textColor = .black
        secondTrialLabel.font = .notoReg(size: 30 * ratio)
        
        stackView.addArrangedSubview(thirdTrialLabel)
        thirdTrialLabel.layer.borderWidth = 1
        thirdTrialLabel.layer.borderColor = UIColor.gray3.cgColor
        thirdTrialLabel.textAlignment = .center
        thirdTrialLabel.textColor = .black
        thirdTrialLabel.font = .notoReg(size: 20 * ratio)
    }
    
}
