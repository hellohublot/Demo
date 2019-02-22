//
//  HTGrassController.swift
//  Tmall
//
//  Created by hublot on 2018/11/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTGrassController: UIViewController {
	
	lazy var navigationBar: HTGrassNavigationBar = {
		let navigationBar = HTGrassNavigationBar.init(frame: CGRect.zero)
		return navigationBar
	}()
	
	lazy var backgroundView: HTGrassBackgroundView = {
		let backgroundView = HTGrassBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()

	lazy var collectionView: UICollectionView = {
        let fallLayout = HTCollectionFallLayout()
        fallLayout.delegate = self
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: fallLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.alwaysBounceVertical = true
		collectionView.backgroundView = backgroundView
		collectionView.register(HTGrassDiscoverHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTGrassDiscoverHeaderView.identifier)
		return collectionView
	}()
	
	
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTGrassSectionModel.packModelArray()
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
		collectionView.contentInset = UIEdgeInsets.init(top: HTGrassBackgroundView.backgroundHeaderHeight, left: 0, bottom: 0, right: 0)
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		navigationBar.snp.makeConstraints { (maker) in
			maker.left.top.right.equalTo(0)
			maker.height.equalTo(HTGrassNavigationBar.navigationHeight)
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
}

extension HTGrassController: CollectionViewThrough, HTCollectionFallDelegateLayout {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		backgroundView.reloadAnimatedWithImageTop(min(0, -HTGrassBackgroundView.backgroundHeaderHeight - offsetY))
		navigationBar.reloadAnimatedWithOffset(HTGrassBackgroundView.backgroundHeaderHeight + offsetY)
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTGrassSectionModel
		switch sectionModel?.type {
		case .discover?:
			return HTGrassDiscoverCell.self
		default:
			return HTGrassDiscoverCell.self
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTGrassSectionModel
		var reuseClass: ReuseCell.Type
		switch sectionModel?.type {
		case .discover?:
			reuseClass = HTGrassDiscoverHeaderView.self
		default:
			reuseClass = HTGrassDiscoverHeaderView.self
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
		let sectionModel = collectionView.sectionModelArray()[section] as? HTGrassSectionModel
		switch sectionModel?.type {
		case .discover?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 60)
		default:
			return CGSize.zero
		}
	}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountForSectionAt section: Int) -> Int {
        let sectionModel = collectionView.sectionModelArray()[section] as? HTGrassSectionModel
        switch sectionModel?.type {
        case .discover?:
            return 2
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
        let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTGrassSectionModel
        switch sectionModel?.type {
        case .discover?:
            let model = (sectionModel?.modelArray as? [HTGrassDiscoverModel])?[indexPath.row]
            return model?.height ?? 0
        default:
            return 0
        }
    }
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, lineSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTGrassSectionModel
		switch sectionModel?.type {
		case .discover?:
			return 10
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, interitemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTGrassSectionModel
		switch sectionModel?.type {
		case .discover?:
			return 8
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTGrassSectionModel
		switch sectionModel?.type {
		case .discover?:
			return UIEdgeInsets.init(top: 0, left: 10, bottom: 10, right: 10)
		default:
			return UIEdgeInsets.zero
		}
	}
	
	
}
