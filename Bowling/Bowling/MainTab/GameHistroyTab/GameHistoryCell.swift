//
//  GameHistoryCell.swift
//  Bowling
//
//  Created by Kyo on 1/20/21.
//

import UIKit

class GameHistoryCell: UICollectionViewCell {
    // MARK:- View components
    private let stackView = UIStackView()
    public let dateLabel = UILabel()
    public let redLabel = UILabel()
    public let blueLabel = UILabel()
    public let greenLabel = UILabel()
    public let blueCrown = UIImageView()
    public let redCrown = UIImageView()
    public let greenCrown = UIImageView()

    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        dateLabel.text = ""
        blueLabel.text = "Blue\n--"
        redLabel.text = "Red\n--"
        greenLabel.text = "Green\n--"
        blueCrown.isHidden = true
        redCrown.isHidden = true
        greenCrown.isHidden = true
    }
    
    // MARK:- Configures
    private func configure() {
        blueCrown.isHidden = true
        redCrown.isHidden = true
        greenCrown.isHidden = true
    }
    
    private func configureUI() {
        backgroundColor = .white

        addSubview(dateLabel)
        dateLabel.textColor = .white
        dateLabel.backgroundColor = .gray7
        dateLabel.font = .notoReg(size: 20 * ratio)
        dateLabel.textAlignment = .center
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(30 * ratio)
            make.centerX.equalToSuperview()
        }
        
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.clipsToBounds = true
        stackView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        stackView.addArrangedSubview(blueLabel)
        blueLabel.text = "Blue\n--"
        blueLabel.backgroundColor = .blue
        blueLabel.textAlignment = .center
        blueLabel.numberOfLines = 2
        blueLabel.font = .notoBold(size: 20 * ratio)
        blueLabel.textColor = .white
        blueLabel.textAlignment = .center
        
        blueLabel.addSubview(blueCrown)
        blueCrown.image = UIImage(named: "winner")
        blueCrown.contentMode = .scaleAspectFit
        blueCrown.snp.makeConstraints { make in
            make.width.height.equalTo(50 * ratio)
            make.bottom.equalToSuperview().offset(8 * ratio)
            make.centerX.equalToSuperview()
        }
        
        stackView.addArrangedSubview(redLabel)
        redLabel.text = "Red\n--"
        redLabel.backgroundColor = .red
        redLabel.textAlignment = .center
        redLabel.numberOfLines = 2
        redLabel.font = .notoBold(size: 20 * ratio)
        redLabel.textColor = .white
        redLabel.textAlignment = .center
        
        redLabel.addSubview(redCrown)
        redCrown.image = UIImage(named: "winner")
        redCrown.contentMode = .scaleAspectFit
        redCrown.snp.makeConstraints { make in
            make.width.height.equalTo(50 * ratio)
            make.bottom.equalToSuperview().offset(8 * ratio)
            make.centerX.equalToSuperview()
        }
        
        stackView.addArrangedSubview(greenLabel)
        greenLabel.text = "Green\n--"
        greenLabel.backgroundColor = .green
        greenLabel.textAlignment = .center
        greenLabel.numberOfLines = 2
        greenLabel.font = .notoBold(size: 20 * ratio)
        greenLabel.textColor = .white
        greenLabel.textAlignment = .center
        
        greenLabel.addSubview(greenCrown)
        greenCrown.image = UIImage(named: "winner")
        greenCrown.contentMode = .scaleAspectFit
        greenCrown.snp.makeConstraints { make in
            make.width.height.equalTo(50 * ratio)
            make.bottom.equalToSuperview().offset(8 * ratio)
            make.centerX.equalToSuperview()
        }
    }

}
