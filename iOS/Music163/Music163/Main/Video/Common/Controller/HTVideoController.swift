//
//  HTVideoController.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTVideoController: UIViewController {
	
	let pageModelArray = HTVideoPageModel.packModelArray()

	lazy var navigationBar: HTVideoNavigationBar = {
		let navigationBar = HTVideoNavigationBar.init(frame: CGRect.zero)
		navigationBar.pageHeaderView.pageDelegate = self
		return navigationBar
	}()
	
	lazy var pageContentView: HTPageContentView = {
		let pageContentView = HTPageContentView.init(frame: CGRect.zero)
		pageContentView.pageDelegate = self
		return pageContentView
	}()
	
	var lastSelectedIndex = -1
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		
	}
	
	func initInterface() {
		navigationController?.navigationBar.isHidden = true
		view.addSubview(pageContentView)
		view.addSubview(navigationBar)
		automaticallyAdjustsScrollViewInsets = false
		navigationBar.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(HTDiscoverNavigationBar.navigationBarHeight)
		}
		pageContentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}		
		navigationBar.pageHeaderView.collectionView.setCellModelArray(pageModelArray, proxy: navigationBar.pageHeaderView)
		pageContentView.collectionView.setCellModelArray(pageModelArray, proxy: pageContentView)
		
		view.layoutIfNeeded()
		navigationBar.pageHeaderView.collectionView.reloadData()
		pageContentView.collectionView.reloadData()
		
		pageContentView.scrollViewDidScroll(pageContentView.collectionView)
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/

}


extension HTVideoController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, HTPageContentControllerDelegate {
	
	func reloadNavigationSelecetd(_ indexPath: IndexPath) {
		var modelArray = navigationBar.pageHeaderView.collectionView.cellModelArray() as? [HTPageModelAble] ?? [HTPageModelAble]()
		for var model in modelArray {
			model.selected = false
		}
		modelArray[indexPath.row].selected = true
		navigationBar.pageHeaderView.collectionView.reloadData()
		navigationBar.pageHeaderView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		guard scrollView == pageContentView.collectionView else {
			return
		}
		
		let offsetX = scrollView.contentOffset.x
		let progress = offsetX / scrollView.bounds.size.width
		
		let selectedIndex = Int(round(progress))
		if selectedIndex != lastSelectedIndex {
			reloadNavigationSelecetd(IndexPath.init(row: selectedIndex, section: 0))
		}
		lastSelectedIndex = selectedIndex
		
		let translationX = scrollView.panGestureRecognizer.translation(in: scrollView).x
		let fromIndex = Int(translationX <= 0 ? floor(progress) : ceil(progress))
		let toIndex = Int(translationX > 0 ? floor(progress) : ceil(progress))
		guard let fromFrame = navigationBar.pageHeaderView.collectionView.layoutAttributesForItem(at: IndexPath.init(row: fromIndex, section: 0))?.frame else {
			return
		}
		guard let toFrame = navigationBar.pageHeaderView.collectionView.layoutAttributesForItem(at: IndexPath.init(row: toIndex, section: 0))?.frame else {
			return
		}
		
		var separatorLineFrame = CGRect.init(x: 0, y: navigationBar.pageHeaderView.collectionView.bounds.size.height - 9, width: 0, height: 3)
		navigationBar.pageHeaderView.pageLineView.layer.cornerRadius = 3 / 2.0
		navigationBar.pageHeaderView.collectionView.sendSubview(toBack: navigationBar.pageHeaderView.pageLineView)
		
		if fromIndex <= toIndex {
			if progress - CGFloat(fromIndex) <= 0.5 {
				separatorLineFrame.origin.x = fromFrame.minX
				separatorLineFrame.size.width = fromFrame.width + (toFrame.maxX - fromFrame.maxX) * 2 * (progress - CGFloat(fromIndex))
			} else {
				separatorLineFrame.size.width = toFrame.width + (toFrame.minX - fromFrame.minX) * 2 * (CGFloat(toIndex) - progress)
				separatorLineFrame.origin.x = toFrame.maxX - separatorLineFrame.size.width
			}
		} else {
			if CGFloat(fromIndex) - progress <= 0.5 {
				separatorLineFrame.size.width = fromFrame.width + (fromFrame.minX - toFrame.minX) * 2 * (CGFloat(fromIndex) - progress)
				separatorLineFrame.origin.x = fromFrame.maxX - separatorLineFrame.size.width
			} else {
				separatorLineFrame.origin.x = toFrame.minX
				separatorLineFrame.size.width = toFrame.width + (fromFrame.maxX - toFrame.maxX) * 2 * (progress - CGFloat(toIndex))
			}
		}
		navigationBar.pageHeaderView.pageLineView.frame = separatorLineFrame
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: false)
		pageContentView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
		reloadNavigationSelecetd(indexPath)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let model = pageModelArray[indexPath.row]
		let width = model.title?.width(HTPageHeaderCell.titleFont, collectionView.bounds.size.height) ?? 0
		return CGSize.init(width: width + 15, height: collectionView.bounds.size.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 15
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
	}
	
	func pageContentViewModelWillAppear(_ pageContentView: HTPageContentView, _ pageIndex: Int, _ model: HTPageModelAble?) {
	}
	
	func pageContentViewModelDidAppear(_ pageContentView: HTPageContentView, _ pageIndex: Int, _ model: HTPageModelAble?) {
		guard let model = model as? HTVideoPageModel, let controller = model.controller as? HTVideoContentController else {
			return
		}
		controller.reloadModelArrayWithType(model.type)
	}
	
}
