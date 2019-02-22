//
//  HTIndexController.swift
//  Tmall
//
//  Created by hublot on 2018/11/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexController: UIViewController {
    
	lazy var navigationBar: HTIndexNavigationBar = {
		let navigationBar = HTIndexNavigationBar.init(frame: CGRect.zero)
		return navigationBar
	}()
	
	lazy var backgroundView: HTIndexBackgroundView = {
		let backgroundView = HTIndexBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()
	
	lazy var collectionView: UICollectionView = {
		let fallLayout = HTCollectionFallLayout()
        fallLayout.delegate = self
        fallLayout.register(HTIndexCheapBackgroundView.self, forDecorationViewOfKind: HTIndexCheapBackgroundView.identifier)
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: fallLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.backgroundView = backgroundView
		collectionView.alwaysBounceVertical = true
		collectionView.register(HTIndexCheapHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTIndexCheapHeaderView.identifier)
		collectionView.register(HTIndexDiscoverHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTIndexDiscoverHeaderView.identifier)
		collectionView.register(HTIndexImageFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTIndexImageFooterView.identifier)
		return collectionView
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTIndexSectionModel.packModelArray()
		collectionView.setSectionModelArray(modelArray, proxy: self)
	}
	
	func initInterface() {
		if #available(iOS 11.0, *) {
			collectionView.contentInsetAdjustmentBehavior = .never
		} else {
			automaticallyAdjustsScrollViewInsets = false
		}
		navigationController?.navigationBar.isHidden = true
		
		view.addSubview(collectionView)
		view.addSubview(navigationBar)
		collectionView.contentInset = UIEdgeInsets.init(top: HTIndexNavigationBar.navigationMaxHeight, left: 0, bottom: 0, right: 0)
		navigationBar.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(HTIndexNavigationBar.navigationMaxHeight)
		}
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	

}

extension HTIndexController: CollectionViewThrough, HTCollectionFallDelegateLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
		let curveImageTop = min(0, -HTIndexNavigationBar.navigationMaxHeight - offsetY)
		if (backgroundView.curveImageView.frame.origin.y != curveImageTop) {
			backgroundView.reloadAnimatedWithCurveImageTop(curveImageTop)
		}
		let reloadHeight = max(HTIndexNavigationBar.navigationMinHeight, min(HTIndexNavigationBar.navigationMaxHeight, -offsetY))
		if (navigationBar.bounds.size.height != reloadHeight) {
			navigationBar.snp.updateConstraints { (maker) in
				maker.height.equalTo(reloadHeight)
			}
			navigationBar.reloadAnimatedWithHeight(reloadHeight)
		}
    }
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTIndexSectionModel
		switch sectionModel?.type {
		case .circle?:
			return HTIndexCircleCell.self
		case .banner?:
			return HTIndexBannerCell.self
		case .image?:
			return HTIndexImageCell.self
		case .limit?:
			return HTIndexLimitCell.self
		case .cheap?:
			return HTIndexCheapCell.self
		case .discover?:
			return HTIndexDiscoverCell.self
		case .new?:
			return HTIndexNewCell.self
		case .brand?:
			return HTIndexBrandCell.self
		case .good?:
			return HTIndexGoodCell.self
		default:
			return HTIndexCircleCell.self
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
		if let view = cell as? HTIndexBannerCell {
			view.scrollDidScrollShouldChangeColor = { [weak self] (changeColor) in
				self?.backgroundView.curveImageView.backgroundColor = changeColor
			}
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTIndexSectionModel
        var reuseCellClass: ReuseCell.Type
        switch kind {
        case UICollectionElementKindSectionHeader:
            switch sectionModel?.type {
            case .cheap?:
                reuseCellClass = HTIndexCheapHeaderView.self
            case .discover?:
                reuseCellClass = HTIndexDiscoverHeaderView.self
            default:
                reuseCellClass = HTIndexCheapHeaderView.self
            }
        case UICollectionElementKindSectionFooter:
            switch sectionModel?.type {
            case .banner?:
                reuseCellClass = HTIndexImageFooterView.self
            case .image?:
                reuseCellClass = HTIndexImageFooterView.self
            default:
                reuseCellClass = HTIndexImageFooterView.self
            }
        default:
            reuseCellClass = HTIndexImageFooterView.self
        }
		let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseCellClass.identifier, for: indexPath)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: indexPath)
        reuseView.layer.masksToBounds = true
		return reuseView
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
		switch sectionModel?.type {
		case .cheap?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 40)
		case .discover?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 30)
		default:
			return CGSize.zero
		}

	}
	    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountForSectionAt section: Int) -> Int {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
        switch sectionModel?.type {
        case .circle?:
            return 5
        case .banner?:
            return 1
        case .image?:
            return 1
        case .limit?:
            return 2
        case .cheap?:
            return 4
        case .discover?:
            return 3
        case .new?:
            return 2
        case .brand?:
            return 4
        case .good?:
            return 2
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTIndexSectionModel
        switch sectionModel?.type {
        case .circle?:
            return 80
        case .banner?:
            return 150
        case .image?:
            return 140
        case .limit?:
            return 140
        case .cheap?:
            return 95
        case .discover?:
            return 150
        case .new?:
            return 160
        case .brand?:
            return 100
        case .good?:
            let model = (sectionModel?.modelArray as? [HTIndexGoodModel])?[indexPath.row]
            return model?.height ?? 0
        default:
            return 0
        }
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
		switch sectionModel?.type {
		case .banner?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 15)
		case .image?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 15)			
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, lineSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
		switch sectionModel?.type {
		case .good?:
			return 5
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, interitemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
		switch sectionModel?.type {
		case .limit?:
			return 8
		case .discover?:
			return 8
		case .new?:
			return 5
		case .brand?:
			return 5
		case .good?:
			return 5
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
		switch sectionModel?.type {
        case .circle?:
            return UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
		case .limit?:
			return UIEdgeInsets.init(top: 0, left: 10, bottom: 8, right: 10)
		case .cheap?:
			return UIEdgeInsets.init(top: 0, left: 10, bottom: 15, right: 10)
		case .discover?:
			return UIEdgeInsets.init(top: 8, left: 10, bottom: 0, right: 10)
		case .new?:
			return UIEdgeInsets.init(top: 8, left: 10, bottom: 0, right: 10)
		case .brand?:
			return UIEdgeInsets.init(top: 5, left: 10, bottom: 0, right: 10)
		case .good?:
			return UIEdgeInsets.init(top: 5, left: 10, bottom: 8, right: 10)
		default:
			return UIEdgeInsets.zero
		}
	}
    
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, layoutAttributesForDecorationViewInSection section: Int, sectionContentMinY minY: CGFloat, sectionContentMaxY maxY: CGFloat) -> UICollectionViewLayoutAttributes? {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTIndexSectionModel
        switch sectionModel?.type {
        case .cheap?:
            let attributed = HTCollectionViewLayoutAttributes.init(forDecorationViewOfKind: HTIndexCheapBackgroundView.identifier, with: IndexPath.init(row: 0, section: section))
            attributed.frame = CGRect.init(x: 0, y: minY, width: collectionView.bounds.size.width, height: maxY - minY - 10)
            attributed.zIndex = -1
			attributed.model = sectionModel as Any
            return attributed
        default:
            return nil
        }
    }
	
}
