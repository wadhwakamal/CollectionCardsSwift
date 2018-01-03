//
//  ChatOnboardingCell.swift
//  CollectionCards
//
//  Created by Kamal Wadhwa on 29/12/17.
//  Copyright © 2017 Kamal Wadhwa. All rights reserved.
//

import UIKit

class ChatOnboardingCell: BaseCollectionCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(UINib(nibName: CardCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        pageControl.numberOfPages = 4
    }

}

extension ChatOnboardingCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        cell.numberLabel.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 190)
    }
}

extension ChatOnboardingCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.contentSize.width / CGFloat(collectionView.numberOfItems(inSection: 0))
        if pageWidth <= 70 { return }
        let page = Int(collectionView.contentOffset.x / (pageWidth - 70))
        pageControl.currentPage = page
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let pageWidth = collectionView.contentSize.width / CGFloat(collectionView.numberOfItems(inSection: 0))
        if pageWidth <= 70 { return }
        let index = targetContentOffset.pointee.x / (pageWidth - 70)
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
}
