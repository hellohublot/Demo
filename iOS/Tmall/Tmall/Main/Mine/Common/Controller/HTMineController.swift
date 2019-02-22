//
//  HTMineController.swift
//  Tmall
//
//  Created by hublot on 2018/11/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineController: UIViewController {

	lazy var navigationBar: HTMineNavigationBar = {
		let navigationBar = HTMineNavigationBar.init(frame: CGRect.zero)
		return navigationBar
	}()
	
	lazy var controllerBackgroundView: HTMineControllerBackgroundView = {
		let backgroundView = HTMineControllerBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()
	
	lazy var collectionBackgroundView: HTMineCollectionBackgroundView = {
		let backgroundView = HTMineCollectionBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()
	
	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.alwaysBounceVertical = true
		collectionView.register(HTMineSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTMineSectionHeaderView.identifier)
		collectionView.register(HTMinePacketFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTMinePacketFooterView.identifier)
		collectionView.register(HTMineGiftFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTMineGiftFooterView.identifier)
		collectionView.register(HTMineCardFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTMineCardFooterView.identifier)
		return collectionView
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTMineSectionModel.packModelArray()
		collectionView.setSectionModelArray(modelArray, proxy: self)
	}
	
	func initInterface() {
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = .never
		} else {
			automaticallyAdjustsScrollViewInsets = false
		}
		navigationController?.navigationBar.isHidden = true
		
		view.addSubview(controllerBackgroundView)
		view.addSubview(collectionView)
		view.addSubview(navigationBar)
		controllerBackgroundView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		navigationBar.snp.makeConstraints { (maker) in
			maker.top.left.right.equalTo(0)
			maker.height.equalTo(HTStatic.navigationHeight)
		}
		collectionView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.top.equalTo(navigationBar.snp.bottom)
		}
        
        collectionView.contentInset = UIEdgeInsets.init(top: HTMineCollectionBackgroundView.headerContentHeight, left: 0, bottom: 0, right: 0)
        collectionView.superview?.layoutIfNeeded()
        collectionView.backgroundView = collectionBackgroundView
        
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	

}

extension HTMineController: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		collectionBackgroundView.reloadAnimatedWithContentTop(-HTMineCollectionBackgroundView.headerContentHeight - offsetY)
		navigationBar.reloadAnimatedWithImageOffset(HTMineCollectionBackgroundView.headerContentHeight + offsetY)
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .order?:			
			return HTMineOrderCell.self
		case .collect?:
			return HTMineCollectCell.self
		case .packet?, .point?, .gift?, .card?:
			return HTMineImageCell.self
		case .tool?:
			return HTMineToolCell.self
		default:
			return HTMineOrderCell.self
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
		var reuseClass: ReuseCell.Type
		switch kind {
		case UICollectionElementKindSectionHeader:
			switch sectionModel?.type {
			default:
				reuseClass = HTMineSectionHeaderView.self
			}
		case UICollectionElementKindSectionFooter:
			switch sectionModel?.type {
			case .packet?:
				reuseClass = HTMinePacketFooterView.self
			case .gift?:
				reuseClass = HTMineGiftFooterView.self
			case .card?:
				reuseClass = HTMineCardFooterView.self
			default:
				reuseClass = HTMineSectionHeaderView.self
			}
		default:
			reuseClass = HTMineSectionHeaderView.self
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
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		default:
			return CGSize.init(width: collectionView.bounds.size.width, height: 50)
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
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .order?:			
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(5, indexPath.section), height: 75)
		case .collect?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(4, indexPath.section), height: 75)
		case .packet?, .point?, .gift?, .card?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 65)
		case .tool?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(4, indexPath.section), height: 70)
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .packet?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 60)
		case .gift?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 50)
		case .card?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 50)
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		default:
			return UIEdgeInsets.init(top: 0, left: 15, bottom: 5, right: 15)
		}
	}

	
}
