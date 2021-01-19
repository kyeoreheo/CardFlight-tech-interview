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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configureUI() {
        backgroundColor = .red
//        addSubview(frameLabel)
//        //frameLabel.text = "0"
//        frameLabel.textAlignment = .center
//        frameLabel.backgroundColor = .blue
//        frameLabel.textColor = .white
//        frameLabel.font = .notoBold(size: 20 * ratio)
//        frameLabel.snp.makeConstraints { make in
//            make.top.left.right.equalToSuperview()
//            make.height.equalTo(30 * ratio)
//        }
    }
}
