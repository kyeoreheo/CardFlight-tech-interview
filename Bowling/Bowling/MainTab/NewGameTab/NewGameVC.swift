//
//  NewGameTab.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit
import SnapKit

class NewGameVC: UIViewController {
    // MARK:- View components
    private let saveButton = UIButton()
    private let saveLabel = UILabel()
    private let resetButton = UIButton()
    private let resetLabel = UILabel()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    var sections = [GameSection]()

    // MARK:- Properties
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sections.append(GameSection(name: "Blue", color: .blue))
        sections.append(GameSection(name: "Red", color: .red))
        sections.append(GameSection(name: "Green", color: .green))

        configureUI()
    }
    
    // MARK:- Configures
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        saveButton.setImage(UIImage(named: "save"), for: .normal)
        saveButton.snp.makeConstraints { make in
            make.width.height.equalTo(30 * ratio)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        view.addSubview(saveLabel)
        saveLabel.text = "Save"
        saveLabel.textColor = .black
        saveLabel.font = .notoReg(size: 12 * ratio)
        saveLabel.textAlignment = .right
        saveLabel.snp.makeConstraints { make in
            make.centerY.equalTo(saveButton)
            make.right.equalTo(saveButton.snp.left).offset(-8)
        }
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(stackView)
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.spacing = 8
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        sections.forEach {
            stackView.addArrangedSubview($0.view)
        }
    }
    
    @objc func plusButtonTapped() {
//        stackView.addArrangedSubview(GameSection(name: "New Player").view)
        var players = [String]()
        var colors = [UIColor]()
        var scores = [Int]()
        sections.forEach {
            //played at least one
            if $0.gameCVC.game.board[0].points[0] != .idle {
                players.append($0.name)
                colors.append($0.color)
                scores.append($0.gameCVC.game.board[$0.gameCVC.game.currentFrame].cumulativeScore)
                $0.gameCVC.resetGame()
                $0.trialCVC.resetTrial()
            }
        }
        
        let history = History(players: players, colors: colors, scores: scores)
        Storage.shared.histories.append(history)
        
        
    }
}
