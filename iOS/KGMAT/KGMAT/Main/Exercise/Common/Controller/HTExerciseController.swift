//
//  HTExerciseController.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseController: UIViewController {

    lazy var navigationBar: HTExerciseNavigationBar = {
        let navigationBar = HTExerciseNavigationBar.init(frame: CGRect.zero)
        return navigationBar
    }()
	
	lazy var backgroundView: HTExerciseBackgroundView = {
		let backgroundView = HTExerciseBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()
	
	lazy var signButton: HTExerciseSignButton = {
		let button = HTExerciseSignButton.init(frame: CGRect.zero)
		return button
	}()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.alwaysBounceVertical = true
		collectionView.showsVerticalScrollIndicator = false
		collectionView.register(HTExerciseSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTExerciseSectionHeaderView.identifier)
        return collectionView
    }()
    
    /*-------------------------------------/ init /-----------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataSource()
        initInterface()
    }
    
    func initDataSource () {
		let modelArray = HTExerciseSectionModel.packModelArray()
		collectionView.setSectionModelArray(modelArray, proxy: self)
    }
    
    func initInterface() {
        navigationController?.navigationBar.isHidden = true
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        view.addSubview(collectionView)
		view.addSubview(signButton)
		view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (maker) in
            maker.left.right.top.equalTo(0)
            maker.height.equalTo(HTExerciseNavigationBar.navigationHeight)
        }
		collectionView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.top.equalTo(navigationBar.snp.bottom)
		}
		signButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(0)
			maker.centerY.equalTo(0)
		}
		collectionView.backgroundView = backgroundView
		scrollViewDidScroll(collectionView)
    }
    
    /*-------------------------------------/ controller override /-----------------------------------*/
    

}

extension HTExerciseController: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		backgroundView.reloadImageAnimationWithOffset(scrollView.contentOffset.y)
		signButton.snp.updateConstraints { (maker) in
			maker.centerY.equalTo(HTExerciseNavigationBar.navigationHeight + 110 - scrollView.contentOffset.y)
		}
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTExerciseSectionModel
		switch sectionModel?.type {
		case .count?:
			return HTExerciseCountCell.self
		case .question?:
			return HTExerciseQuestionCell.self
		case .hard?:
			return HTExerciseHardCell.self
		case .guide?:
			return HTExerciseGuideCell.self
		default:
			return HTExerciseCountCell.self
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTExerciseSectionModel
		let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HTExerciseSectionHeaderView.identifier, for: indexPath)
		(reuseView as? ReuseCell)?.setModel(sectionModel, for: indexPath)
		return reuseView
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
        (cell as? HTExerciseQuestionCell)?.reloadQuestionHeight = { [weak self] in
            self?.collectionView.reloadData()
        }
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTExerciseSectionModel
		switch sectionModel?.type {
		case .count?:
			return CGSize.zero
		default:
			return CGSize.init(width: collectionView.bounds.size.width, height: 60)
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
		let sectionModel = collectionView.sectionModelArray()[indexPath.section] as? HTExerciseSectionModel
		switch sectionModel?.type {
		case .count?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 110)
		case .question?:
            guard let questionModel = sectionModel?.modelArray[indexPath.row] as? HTExerciseQuestionModel else {
                return CGSize.zero
            }
            let questionPageModel: HTExerciseQuestionPageModel? = {
                for model in questionModel.pageModelArray {
                    if model.selected == true {
                        return model
                    }
                }
                return nil
            }()
            let questionHeight = CGFloat((questionPageModel?.itemModelArray.count ?? 0) * 100 + 80)
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: questionHeight)
		case .hard?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(3, indexPath.section), height: 40)
		case .guide?:
			return CGSize.init(width: itemWidthFromItemSingleColumnCount(1, indexPath.section), height: 95)
		default:
			return CGSize.zero
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTExerciseSectionModel
		switch sectionModel?.type {
		case .hard?:
			return 10
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let sectionModel = collectionView.sectionModelArray()[section] as? HTExerciseSectionModel
		switch sectionModel?.type {
		case .hard?:
			return UIEdgeInsets.init(top: 0, left: 15, bottom: 20, right: 15)
		case .guide?:
			return UIEdgeInsets.init(top: 0, left: 15, bottom: 30, right: 15)
		default:
			return UIEdgeInsets.zero
		}
	}
	
}
