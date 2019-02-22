//
//  HTDiscoverPageContentView.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

protocol HTPageContentControllerDelegate: UICollectionViewDelegate {
	
	func pageContentViewModelWillAppear(_ pageContentView: HTPageContentView, _ pageIndex: Int, _ model: HTPageModelAble?)
	
	func pageContentViewModelDidAppear(_ pageContentView: HTPageContentView, _ pageIndex: Int, _ model: HTPageModelAble?)
	
}

class HTPageContentView: UIView {
	
	weak var pageDelegate: HTPageContentControllerDelegate?
	
	var lastPageIndex = -1

	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		flowLayout.scrollDirection = .horizontal
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
		collectionView.allowsSelection = false
		collectionView.scrollsToTop = false
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = .never
		}
		return collectionView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(collectionView)
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension HTPageContentView: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		pageDelegate?.scrollViewDidScroll?(scrollView)
		let pageIndexValue = scrollView.contentOffset.x / scrollView.bounds.size.width
		let pageIndexNumber = Int(floor(pageIndexValue))
		if pageIndexValue == CGFloat(pageIndexNumber), lastPageIndex != pageIndexNumber {
			let indexPath = IndexPath.init(row: pageIndexNumber, section: 0)
			let model = collectionView.cellModelArray()[pageIndexNumber] as? HTPageModelAble
			if let _ = collectionView.cellForItem(at: indexPath) {
				pageDelegate?.pageContentViewModelDidAppear(self, pageIndexNumber, model)
			}
			lastPageIndex = pageIndexNumber
		}
	}
		
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		pageDelegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTPageContentCell.self
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		let model = collectionView.cellModelArray()[indexPath.row] as? HTPageModelAble
		pageDelegate?.pageContentViewModelWillAppear(self, indexPath.row, model)
		if indexPath.row == lastPageIndex {
			pageDelegate?.pageContentViewModelDidAppear(self, indexPath.row, model)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = reuseView(collectionView, cellForRowAt: indexPath)
		let model = collectionView.cellModelArray()[indexPath.row] as? HTPageModelAble
		if indexPath.row == lastPageIndex {
			pageDelegate?.pageContentViewModelDidAppear(self, indexPath.row, model)
		}
		return cell as! UICollectionViewCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return collectionView.bounds.size
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.zero
	}

	
}
