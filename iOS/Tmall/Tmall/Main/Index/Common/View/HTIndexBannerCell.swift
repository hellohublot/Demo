//
//  HTIndexBannerCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift
import HTScrollPageView

class HTIndexBannerCell: UICollectionViewCell, ReuseCell {
	
	var scrollDidScrollShouldChangeColor: ((_: UIColor) -> Void)?
	
	lazy var bannerView: HTScrollPageView = {
		let bannerView = HTScrollPageView.init(frame: CGRect.zero)
		bannerView.delegate = self
		return bannerView
	}()
	
	lazy var pageControl: UIPageControl = {
		let pageControl = UIPageControl.init(frame: CGRect.zero)
		pageControl.hidesForSinglePage = true
        pageControl.isUserInteractionEnabled = false
		return pageControl
	}()
	
	lazy var modelArray = [HTIndexBannerModel]()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(bannerView)
		contentView.addSubview(pageControl)
		bannerView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		pageControl.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-5)
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? [HTIndexBannerModel], model != modelArray else {
			return
		}
		modelArray = model
		pageControl.numberOfPages = model.count
		bannerView.reloadData()
	}
	
}

extension HTIndexBannerCell: HTScrollPageDelegate {
	
	func scrollPageViewDidScroll(_ pageView: HTScrollPageView!, indexOffset: CGFloat) {
		let leftPage = Int(floor(indexOffset))
		var rightPage = leftPage + 1
		if (rightPage >= modelArray.count) {
			rightPage = 0
		}
		let rightDevide = indexOffset - CGFloat(leftPage)
		let leftDevice = 1 - rightDevide
		let defaultColor:[CGFloat] = [0, 0, 0, 0]
		let leftColorList = modelArray[leftPage].tintColor?.cgColor.components ?? defaultColor
		let rightColorList = modelArray[rightPage].tintColor?.cgColor.components ?? defaultColor
		var changeColorList = defaultColor
		for i in 0..<4 {
			changeColorList[i] = leftColorList[i] * leftDevice + rightColorList[i] * rightDevide
		}
		let changeColor = UIColor.init(red: changeColorList[0], green: changeColorList[1], blue: changeColorList[2], alpha: changeColorList[3])
		scrollDidScrollShouldChangeColor?(changeColor)
	}
	
	func number(of pageView: HTScrollPageView!) -> Int {
		return modelArray.count
	}
	
	func buttonInitPageView(_ pageView: HTScrollPageView!, button: UIButton!) {
		button.contentEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 0, right: 10)
		button.imageView?.contentMode = .scaleAspectFill
        button.isUserInteractionEnabled = false
	}
	
	func buttonWillDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
		let model = modelArray[indexRow]
		button.setImage(model.image, for: .normal)
	}
	
	func buttonDidDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
		pageControl.currentPage = indexRow
	}
	
}
