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
    public var board = Game().board {
        didSet {
            
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
        configure()
    }
    // MARK:- Configuress
    private func configure() {
        collectionView.backgroundColor = .green
        collectionView.register(FrameCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK:- Extentions
extension GameCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return board.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FrameCell
//
//        let currentItem = products[indexPath.row]
//        cell.viewModel.filterValues(productName: currentItem.title,
//             imageStringURLs: currentItem.images,
//             merchant: currentItem.merchant,
//             createdAt: currentItem.createdAt,
//             websiteURL: currentItem.url)
//        cell.delegate = delegate
//        cell.product = products[indexPath.row]
//
        cell.frameLabel.text = String(indexPath.row)
        return cell
    }
    
}
