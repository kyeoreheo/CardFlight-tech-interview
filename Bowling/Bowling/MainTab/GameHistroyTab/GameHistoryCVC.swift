//
//  HistoryCVC.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class GameHistoryCVC: UICollectionViewController {
    // MARK:- Properties
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
    
    // MARK:- Configures
    private func configure() {
        collectionView.backgroundColor = .white
        collectionView.register(GameHistoryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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
        
        let currentHistory = Storage.shared.histories[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy hh:mm"
        cell.dateLabel.text = formatter.string(from: currentHistory.date)
        
        currentHistory.players.forEach {
            if $0.color == .blue {
                cell.blueLabel.text = "Blue\n\(String($0.score))"
                if $0.score == currentHistory.maxScore() {
                    cell.blueCrown.isHidden = false
                }
            }
            
            if $0.color == .red {
                cell.redLabel.text = "Red\n\(String($0.score))"
                if $0.score == currentHistory.maxScore() {
                    cell.redCrown.isHidden = false
                }
            }
            
            if $0.color == .green {
                cell.greenLabel.text = "Green\n\(String($0.score))"
                if $0.score == currentHistory.maxScore() {
                    cell.greenCrown.isHidden = false
                }
            }
        }
        return cell
    }
    
}
