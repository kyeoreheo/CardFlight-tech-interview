//
//  HistoryCVC.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class GameHistoryCVC: UICollectionViewController {
    // MARK:- Properties
//    weak var delegate: TrialCVCDelegate?
    public var histories: [History]? {
        didSet {
            collectionView.reloadData()
        }
    }
    private let reuseIdentifier = "gameHistoryCell"

    // MARK:- Lifecycles
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .vertical
        myLayout.minimumLineSpacing = 4
        super.init(collectionViewLayout: myLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK:- Configuress
    private func configure() {
        collectionView.backgroundColor = .white
        collectionView.register(GameHistoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}

// MARK:- Extentions
extension GameHistoryCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 150 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return histories?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GameHistoryCell
        else { return UICollectionViewCell() }

//        cell.trialLabel.text = pointToString(trials[indexPath.row])
//        cell.cover.isHidden = game.isValid(ifAdd: trials[indexPath.row]) && !game.isDone()
        return cell
    }
    
}
