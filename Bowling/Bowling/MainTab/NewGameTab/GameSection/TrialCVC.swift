//
//  TrialCVC.swift
//  Bowling
//
//  Created by Kyo on 1/19/21.
//

import UIKit

class TrialCVC: UICollectionViewController {
    // MARK:- View components
    // MARK:- Properties
    weak var delegate: TrialCellDelegate?
    private let reuseIdentifier = "trialCells"
    public var trials: [Point] = [.strike, .spare, .miss, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine]

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
        collectionView.backgroundColor = .red
        collectionView.register(TrialCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK:- Extentions
extension TrialCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150 * ratio, height: 50 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return trials.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TrialCell
        
        cell.delegate = delegate
        
        return cell
    }
    
}
