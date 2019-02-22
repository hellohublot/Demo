//
//  HTDiscoverController.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTDiscoverController: UIViewController {

	lazy var navigationBar: HTDiscoverNavigationBar = {
		let navigationBar = HTDiscoverNavigationBar.init(frame: CGRect.zero)
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
		let pageModelArray = HTDiscoverPageModel.packModelArray()
		navigationBar.pageHeaderView.collectionView.setCellModelArray(pageModelArray, proxy: navigationBar.pageHeaderView)
		pageContentView.collectionView.setCellModelArray(pageModelArray, proxy: pageContentView)
		
		view.layoutIfNeeded()

		navigationBar.pageHeaderView.collectionView.reloadData()
		pageContentView.collectionView.reloadData()
		pageContentView.scrollViewDidScroll(pageContentView.collectionView)
		
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/

}

extension HTDiscoverController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, HTPageContentControllerDelegate {
	
	func reloadNavigationSelecetd(_ indexPath: IndexPath) {
		var modelArray = navigationBar.pageHeaderView.collectionView.cellModelArray() as? [HTPageModelAble] ?? [HTPageModelAble]()
		for var model in modelArray {
			model.selected = false
		}
		modelArray[indexPath.row].selected = true
		navigationBar.pageHeaderView.collectionView.reloadData()
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

		let scale = fromIndex == toIndex ? 0 : 1 - 2 * abs(CGFloat(fromIndex + toIndex) / 2.0 - progress)
		if fromIndex <= toIndex {
			let width = fromFrame.width + (toFrame.width - fromFrame.width) * (progress - CGFloat(fromIndex))
			let centerX = fromFrame.midX + (toFrame.midX - fromFrame.midX) * (progress - CGFloat(fromIndex))
			separatorLineFrame.size.width = width * 0.2 + 40 * scale
			navigationBar.pageHeaderView.pageLineView.frame = separatorLineFrame
			navigationBar.pageHeaderView.pageLineView.center.x = centerX
		} else {
			let width = fromFrame.width + (toFrame.width - fromFrame.width) * (CGFloat(fromIndex) - progress)
			let centerX = toFrame.midX + (fromFrame.midX - toFrame.midX) * (progress - CGFloat(toIndex))
			separatorLineFrame.size.width = width * 0.2 + 40 * scale
			navigationBar.pageHeaderView.pageLineView.frame = separatorLineFrame
			navigationBar.pageHeaderView.pageLineView.center.x = centerX
		}
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: false)
		pageContentView.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
		reloadNavigationSelecetd(indexPath)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let contentInset = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: 0)
		let width = (collectionView.bounds.size.width - contentInset.left - contentInset.right) / CGFloat(collectionView.cellModelArray().count)
		return CGSize.init(width: width, height: collectionView.bounds.size.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 30)
	}
	
	func pageContentViewModelWillAppear(_ pageContentView: HTPageContentView, _ pageIndex: Int, _ model: HTPageModelAble?) {
		
	}
	
	func pageContentViewModelDidAppear(_ pageContentView: HTPageContentView, _ pageIndex: Int, _ model: HTPageModelAble?) {
		
	}
	
}
