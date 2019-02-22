//
//  HTDiscoverRecommendController.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendController: UIViewController {

	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.alwaysBounceVertical = true
		collectionView.register(HTDiscoverRecommendSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTDiscoverRecommendSectionHeaderView.identifier)
        collectionView.register(HTDiscoverRecommendCircleFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTDiscoverRecommendCircleFooterView.identifier)
		return collectionView
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTDiscoverRecommendSectionModel.packModelArray()
		collectionView.setSectionModelArray(modelArray, proxy: self)
	}
	
	func initInterface() {
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
		view.addSubview(collectionView)
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		collectionView.contentInset = UIEdgeInsets.init(top: HTDiscoverNavigationBar.navigationBarHeight, left: 0, bottom: HTStatic.tabbarHeight, right: 0)
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
}

extension HTDiscoverRecommendController: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
		case .banner?:
			return HTDiscoverRecommendBannerCell.self
		case .circle?:
			return HTDiscoverRecommendCircleCell.self
		case .bill?:
			return HTDiscoverRecommendBillCell.self
		case .news?:
			return HTDiscoverRecommendNewsCell.self
		case .vip?:
			return HTDiscoverRecommendVipView.self
		case .radio?:
			return HTDiscoverRecommendRadioCell.self
		case .article?:
			return HTDiscoverRecommendArticleCell.self
		default:
			return HTDiscoverRecommendBillCell.self 
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTDiscoverRecommendSectionModel
		var reuseClass: ReuseCell.Type
        switch kind {
        case UICollectionElementKindSectionHeader:
            switch sectionModel?.type {
            case .bill?, .news?, .radio?:
                reuseClass = HTDiscoverRecommendSectionHeaderView.self
            default:
                reuseClass = HTDiscoverRecommendSectionHeaderView.self
            }
        case UICollectionElementKindSectionFooter:
            switch sectionModel?.type {
            case .circle?:
                reuseClass = HTDiscoverRecommendCircleFooterView.self
            default:
                reuseClass = HTDiscoverRecommendCircleFooterView.self
            }
        default:
            reuseClass = HTDiscoverRecommendSectionHeaderView.self
        }
		let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseClass.identifier, for: indexPath)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: indexPath)
		return reuseView
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
        case .bill?:
            return CGSize.init(width: collectionView.bounds.size.width, height: 50)
		case .news?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 70)
		case .radio?:
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
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
		case .banner?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 147)
		case .circle?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(4, indexPath.section), height: 104)
		case .bill?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 165)
		case .news?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 165)
		case .vip?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 350)
		case .radio?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 165)
		case .article?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 160) 
		default:
			return CGSize.zero			
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
        case .circle?:
            return CGSize.init(width: collectionView.bounds.size.width, height: 10)
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
		case .bill?, .news?, .radio?:
			return 10
		default:
			return 0		
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
		case .bill?, .news?, .radio?:
			return 2
		default:
			return 0		
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTDiscoverRecommendSectionModel
		switch sectionModel?.type {
		case .bill?, .news?:
			return UIEdgeInsets.init(top: 0, left: 6, bottom: 0, right: 6)
		case .radio?:
			return UIEdgeInsets.init(top: 0, left: 6, bottom: 20, right: 6)
		default:
			return UIEdgeInsets.zero			
		}
	}

	
}
