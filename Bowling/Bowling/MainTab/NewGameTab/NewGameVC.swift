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
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    var sections = [GameSection]()

    // MARK:- Properties
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        sections.append(GameSection(name: "kyo"))
        sections.append(GameSection(name: "Cat"))
        sections.append(GameSection(name: "Dog"))

        configureUI()
        
        
    }
    // MARK:- Configures
    func configureUI() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = .orange
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(stackView)
        stackView.backgroundColor = .purple
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
