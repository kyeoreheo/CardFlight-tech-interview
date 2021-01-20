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
    private let label = UILabel()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    var sections = [GameSection]()

    // MARK:- Properties
    
    // MARK:- Lifecycless
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sections.append(GameSection(name: "Player 1"))
        sections.append(GameSection(name: "Player 2"))
        sections.append(GameSection(name: "Player 3"))

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
        
        view.addSubview(label)
        label.text = "Save"
        label.textColor = .black
        label.font = .notoReg(size: 12 * ratio)
        label.textAlignment = .right
        label.snp.makeConstraints { make in
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
        stackView.addArrangedSubview(GameSection(name: "New Player").view)
    }
}
