//
//  HTCircleController.swift
//  Tmall
//
//  Created by hublot on 2018/11/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCircleController: UIViewController {

	lazy var navigationBar: HTCircleNavigationBar = {
		let navigationBar = HTCircleNavigationBar.init(frame: CGRect.zero)
		return navigationBar
	}()
	
	lazy var backgroundView: HTCircleBackgroundView = {
		let backgroundView = HTCircleBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()
	
	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.alwaysBounceVertical = true
		collectionView.register(HTCircleRecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTCircleRecommendHeaderView.identifier)
		return collectionView
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTCircleSectionModel.packModelArray()
		collectionView.setSectionModelArray(modelArray, proxy: self)
	}
	
	func initInterface() {
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = .never
		} else {
			automaticallyAdjustsScrollViewInsets = false
		}
		navigationController?.navigationBar.isHidden = true
		
		view.addSubview(backgroundView)
		view.addSubview(collectionView)
		view.addSubview(navigationBar)
		backgroundView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		collectionView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.top.equalTo(HTCircleNavigationBar.navigationHeight)
		}
		navigationBar.snp.makeConstraints { (maker) in
			maker.top.left.right.equalTo(0)
			maker.height.equalTo(HTCircleNavigationBar.navigationHeight)
		}

	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
}

extension HTCircleController: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		backgroundView.reloadAnimatedWithImageTop(min(0, -offsetY))
		navigationBar.reloadAnimatedWithImageTop(offsetY)
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTCircleSectionModel
		switch sectionModel?.type {
		case .activity?:			
			return HTCircleActivityCell.self
		case .recommend?:
			return HTCircleRecommendCell.self
		default:
			return HTCircleActivityCell.self
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTCircleSectionModel
		var reuseClass: ReuseCell.Type
		switch sectionModel?.type {
		case .recommend?:
			reuseClass = HTCircleRecommendHeaderView.self
		default:
			reuseClass = HTCircleRecommendHeaderView.self
		}
		let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseClass.identifier, for: indexPath)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: indexPath)
		return reuseView
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTCircleSectionModel
		switch sectionModel?.type {
		case .recommend?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 70)
		default:
			return CGSize.zero
		}
	}
	
	func itemWidthFromItemSingleColumnCount(_ count: Int, _ section: Int) -> CGFloat {
		var width = collectionView.frame.size.width
		let sectionInset = collectionView(collectionView, layout: collectionView.collectionViewLayout, insetForSectionAt: section)
		let minimumInteritemWidth = collectionView(collectionView, layout: collectionView.collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
		width -= (sectionInset.left + sectionInset.right)
		width -= (CGFloat(count - 1) * minimumInteritemWidth)
		return floor(width / CGFloat(count))
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTCircleSectionModel
		switch sectionModel?.type {
		case .activity?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 75)
		case .recommend?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(2, indexPath.section), height: 235)
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTCircleSectionModel
		switch sectionModel?.type {
		case .activity?:
			return 6
		case .recommend?:
			return 10
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTCircleSectionModel
		switch sectionModel?.type {
		case .activity?:
			return 6
		case .recommend?:
			return 8
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTCircleSectionModel
		switch sectionModel?.type {
		case .activity?:
			return UIEdgeInsets.init(top: 0, left: 12, bottom: 0, right: 12)
		case .recommend?:
			return UIEdgeInsets.init(top: 0, left: 12, bottom: 10, right: 12)
		default:
			return UIEdgeInsets.zero
		}
	}

	
}
