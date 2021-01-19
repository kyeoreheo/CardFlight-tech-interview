//
//  NewGameCVC.swift
//  Bowling
//
//  Created by Kyo on 1/18/21.
//

import UIKit

class GameCVC: UICollectionViewController {
    // MARK:- View components
    // MARK:- Properties
    weak var delegate: FrameCellDelegate?
    private let reuseIdentifier = "frameCell"
    public var game = Game()
    public lazy var board = game.board {
        didSet {
            collectionView.reloadData()
        }
    }
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
        test1()
        configure()
    }
    
    func test1() {
        game.addPoint(of: .strike)
        game.addPoint(of: .seven)
        game.addPoint(of: .spare)
        game.addPoint(of: .nine)
        game.addPoint(of: .miss)
        
//        game.addPoint(of: .strike)
//        game.addPoint(of: .miss)
//        game.addPoint(of: .eight)
//        game.addPoint(of: .eight)
//        game.addPoint(of: .spare)
//        game.addPoint(of: .miss)
//        game.addPoint(of: .six)
//        game.addPoint(of: .strike)
//        game.addPoint(of: .strike)
//        game.addPoint(of: .strike)
//        game.addPoint(of: .eight)
//        game.addPoint(of: .one)
    }
    
    // MARK:- Configuress
    private func configure() {
        collectionView.backgroundColor = .green
        collectionView.register(FrameCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK:- Extentions
extension GameCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150 * ratio, height: 150 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return game.board.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FrameCell
        
        cell.frameLabel.text = String(game.board[indexPath.row].number)
        cell.firstTrialLabel.text = pointToString(game.board[indexPath.row].points[0])
        cell.cumulativePointLabel.text = String(game.board[indexPath.row
        ].cumulativeScore)
        
        if game.board[indexPath.row].points[1] != .idle {
            if game.board[indexPath.row].points[0].rawValue + game.board[indexPath.row].points[1].rawValue == 10 {
                cell.secondTrialLabel.text = pointToString(.spare)
            } else {
                cell.secondTrialLabel.text = pointToString(game.board[indexPath.row].points[1])
            }
        }

        cell.delegate = delegate
        cell.parent = self
        cell.index = indexPath.row
        cell.cover.isHidden = cell.firstTrialLabel.text == "N/A"
        
        return cell
    }
    
}
