//
//  HTMineController.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineController: UIViewController {

	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.register(HTMineCreateHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTMineCreateHeaderView.identifier)
		collectionView.register(HTMineCreateFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: HTMineCreateFooterView.identifier)
		collectionView.register(HTMineRecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTMineRecommendHeaderView.identifier)
		collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 60, right: 0)
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
		navigationItem.title = "我的音乐"
        let cloudNavigationItem = UIBarButtonItem.init(image: UIImage.init(named: "78abbc107272bd1a6ccf7666fafaa334")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = cloudNavigationItem
		view.addSubview(collectionView)
		collectionView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/

}

extension HTMineController: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .record?:
			return HTMineRecordCell.self
		case .create?:
			return HTMineCreateCell.self
		case .recommend?:
			return HTMineRecommendCell.self
		default:
			return HTMineRecordCell.self 
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
			case .create?:
				reuseClass = HTMineCreateHeaderView.self
			case .recommend?:
				reuseClass = HTMineRecommendHeaderView.self
			default:
				reuseClass = HTMineCreateHeaderView.self			
			}
		case UICollectionElementKindSectionFooter:
			switch sectionModel?.type {
			case .create?:
				reuseClass = HTMineCreateFooterView.self
			default:
				reuseClass = HTMineCreateFooterView.self			
			}
		default:
			reuseClass = HTMineCreateFooterView.self
		}
		let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseClass.identifier, for: indexPath)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: indexPath)
		return reuseView
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .create?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 30)
		case .recommend?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 45)
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
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .record?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 55)
		case .create?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 55)
		case .recommend?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 165)
		default:
			return CGSize.zero			
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .create?:
			return CGSize.init(width: collectionView.bounds.size.width, height: 35)
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .recommend?:
			return 3
		default:
			return 0		
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .recommend?:
			return 3
		default:
			return 0		
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTMineSectionModel
		switch sectionModel?.type {
		case .recommend?:
			return UIEdgeInsets.init(top: 0, left: 6, bottom: 0, right: 6)
		default:
			return UIEdgeInsets.zero			
		}
	}
	
} 
