//
//  TrialCVC.swift
//  Bowling
//
//  Created by Kyo on 1/19/21.
//

import UIKit
protocol TrialCVCDelegate: class {
    func trialCellTapped(index: Int, point: Point)
}

class TrialCVC: UICollectionViewController {    
    // MARK:- Properties
    weak var delegate: TrialCVCDelegate?
    private let reuseIdentifier = "trialCells"
    public var trials: [Point] = [.strike, .spare, .miss, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine]
    public var game: Game?

    // MARK:- Lifecycles
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewFlowLayout()) {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .horizontal
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
        collectionView.register(TrialCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
}

// MARK:- Extentions
extension TrialCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 40 * ratio, height: 40 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trials.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TrialCell,
              let game = game
        else { return UICollectionViewCell() }

        cell.trialLabel.text = pointToString(trials[indexPath.row])
        cell.cover.isHidden = game.isValid(ifAdd: trials[indexPath.row]) && !game.isDone()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let game = game else { return }
        if game.isValid(ifAdd: trials[indexPath.row]) && !game.isDone() {
            delegate?.trialCellTapped(index: indexPath.row, point: trials[indexPath.row])
            collectionView.reloadData()
        }
    }
    
}
