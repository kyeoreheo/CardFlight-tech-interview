//
//  TrialCell.swift
//  Bowling
//
//  Created by Kyo on 1/19/21.
//

import UIKit

protocol TrialCellDelegate: class {

}

class TrialCell: UICollectionViewCell {
    // MARK:- View components
    let frameLabel = UILabel()
    let stackView = UIStackView()
    let firstTrialLabel = UILabel()
    let secondTrialLabel = UILabel()
    let thirdTrialLabel = UILabel()
    let cumulativePointLabel = UILabel()
    let cover = UIView()
    
    // MARK:- Properties
    weak var delegate: TrialCellDelegate?

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        cover.isHidden = true
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Configures
    private func configureUI() {
        backgroundColor = .blue
    }

}
