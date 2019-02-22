//
//  HTExerciseQuestionCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseQuestionCell: UICollectionViewCell, ReuseCell {
    
    var reloadQuestionHeight: (() -> Void)?
    
	lazy var navigationCollectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		flowLayout.scrollDirection = .horizontal
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.isScrollEnabled = false
		return collectionView
	}()
	
	lazy var lineView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 0.32, green: 0.59, blue: 0.92, alpha: 1)
		return view
	}()
	
	lazy var contentCollectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		flowLayout.scrollDirection = .horizontal
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.alwaysBounceHorizontal = true
		collectionView.isPagingEnabled = true
        collectionView.allowsSelection = false
        collectionView.layer.masksToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
		return collectionView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
        layer.masksToBounds = true
		addSubview(navigationCollectionView)
		addSubview(lineView)
		addSubview(contentCollectionView)
		navigationCollectionView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(30)
		}
		lineView.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(navigationCollectionView).offset(5)
			maker.centerX.equalTo(0)
			maker.height.equalTo(3)
			maker.width.equalTo(30)
		}
		contentCollectionView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.top.equalTo(navigationCollectionView.snp.bottom).offset(25)
		}
        layoutIfNeeded()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseQuestionModel else {
			return
		}
        contentCollectionView.setCellModelArray(model.pageModelArray, proxy: self)
        navigationCollectionView.setCellModelArray(model.pageModelArray, proxy: self)
        navigationCollectionView.reloadData()
        contentCollectionView.reloadData()
        scrollViewDidScroll(contentCollectionView)
	}
    
}


extension HTExerciseQuestionCell: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == contentCollectionView else {
            return
        }
        let offsetX = scrollView.contentOffset.x
        let progress = offsetX / scrollView.bounds.size.width
        let navigationItemWidth = collectionView(navigationCollectionView, layout: navigationCollectionView.collectionViewLayout, sizeForItemAt: IndexPath.init()).width
        lineView.snp.updateConstraints { (maker) in
            maker.centerX.equalTo(navigationItemWidth * (progress + 0.5))
        }
    }
    
    func reloadNavigationSelecetd(_ indexPath: IndexPath) {
        let modelArray = navigationCollectionView.cellModelArray() as? [HTExerciseQuestionPageModel] ?? [HTExerciseQuestionPageModel]()
        for model in modelArray {
            model.selected = false
        }
        modelArray[indexPath.row].selected = true
        navigationCollectionView.reloadData()
        reloadQuestionHeight?()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        contentCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        reloadNavigationSelecetd(indexPath)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == contentCollectionView else {
            return
        }
        let offsetX = scrollView.contentOffset.x
        let progress = offsetX / scrollView.bounds.size.width
        reloadNavigationSelecetd(IndexPath.init(row: Int(floor(progress)), section: 0))
    }
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		guard let collectionView = reuseView as? UICollectionView else {
			return HTExerciseQuestionHeaderCell.self
		}
		if collectionView == navigationCollectionView {
			return HTExerciseQuestionHeaderCell.self
		} else {
			return HTExerciseQuestionContentCell.self
		}
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
		let size = collectionView == navigationCollectionView ? CGSize.init(width: navigationCollectionView.bounds.size.width / CGFloat(navigationCollectionView.cellModelArray().count), height: navigationCollectionView.bounds.size.height) : contentCollectionView.bounds.size
		return size
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
