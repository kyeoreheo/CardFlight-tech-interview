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
    private let plusButton = UIButton()
    private let label = UILabel()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    var sections = [GameSection]()

    // MARK:- Properties
    
    
    // MARK:- Lifecycless
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let gameSection = GameSection(name: "Kyo")
//        gameSection.gameCVC.delegate = self
        sections.append(gameSection)
        sections.append(GameSection(name: "Cat"))
        sections.append(GameSection(name: "Dog"))

        configureUI()
    }
    // MARK:- Configures
    func configureUI() {
        view.addSubview(plusButton)
        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30 * ratio)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        view.addSubview(label)
        label.text = "Add new player"
        label.font = .notoReg(size: 12 * ratio)
        label.textAlignment = .right
        label.snp.makeConstraints { make in
            make.centerY.equalTo(plusButton)
            make.right.equalTo(plusButton.snp.left).offset(-8)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(plusButton.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.spacing = 8
        stackView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        sections.forEach {
            stackView.addArrangedSubview($0.view)
        }
  
    }
}

//extension NewGameVC: FrameCellDelegate {
//    func firstTrialButton(board: inout [Frame], index: Int) {
//        board[index].points[0] = .eight
//        print("DEBUG:- firstButon Tapped")
//
//    }
//
//    func secondTrailButton() {
//        print("DEBUG:- second Tapped")
//    }
//
//    func thirdTrailButton() {
//        print("DEBUG:- thrid Tapped")
//    }
//
//}
