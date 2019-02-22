//
//  HTDiscoverNavigationPageHeaderView.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTPageHeaderView: UIView {
	
	weak var pageDelegate: (UICollectionViewDelegate & UICollectionViewDelegateFlowLayout)?

	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		flowLayout.scrollDirection = .horizontal
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.bounces = false
		collectionView.scrollsToTop = false
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = .never
		}
		return collectionView
	}()
	
	lazy var pageLineView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 0.713725, green: 0.180392, blue: 0.172549, alpha: 1)
        view.layer.masksToBounds = true
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(collectionView)
		collectionView.addSubview(pageLineView)
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension HTPageHeaderView: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		pageDelegate?.scrollViewDidScroll?(scrollView)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		pageDelegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTPageHeaderCell.self
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if let size = pageDelegate?.collectionView?(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath) {
			return size
		}
		return CGSize.zero
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		if let minimumLineSpacing = pageDelegate?.collectionView?(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section) {
			return minimumLineSpacing
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		if let minimumInteritemSpacing = pageDelegate?.collectionView?(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section) {
			return minimumInteritemSpacing
		}
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		if let insetForSection = pageDelegate?.collectionView?(collectionView, layout: collectionViewLayout, insetForSectionAt: section) {
			return insetForSection
		}
		return UIEdgeInsets.zero
	}
	
} 

