//
//  HTDiscoverRecommendBannerCell.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift
import HTScrollPageView

class HTDiscoverRecommendBannerCell: UICollectionViewCell, ReuseCell {
	
	var modelArray = [HTDiscoverRecommendBannerModel]()
	
	lazy var bannerView: HTScrollPageView = {
		let bannerView = HTScrollPageView.init(frame: CGRect.zero)
		bannerView.layer.cornerRadius = 3
		bannerView.layer.masksToBounds = true
		bannerView.delegate = self
		bannerView.autoScrollTimeInterval = 0
		return bannerView
	}()
	
	lazy var pageControl: UIPageControl = {
		let pageControl = UIPageControl.init(frame: CGRect.zero)
		pageControl.isUserInteractionEnabled = false
		pageControl.hidesForSinglePage = true
		return pageControl
	}()
    
    lazy var darkView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        view.isUserInteractionEnabled = false
        return view
    }()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(bannerView)
		contentView.addSubview(pageControl)
        contentView.addSubview(darkView)
		bannerView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		pageControl.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(0)
            maker.height.equalTo(20)
			maker.left.right.equalTo(0)
		}
        darkView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? [HTDiscoverRecommendBannerModel], model != modelArray else {
			return
		}
        pageControl.numberOfPages = model.count
		modelArray = model
		bannerView.reloadData()
	}
    
}

extension HTDiscoverRecommendBannerCell: HTScrollPageDelegate {
	
	func number(of pageView: HTScrollPageView!) -> Int {
		return modelArray.count
	}
	
	func buttonWillDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
		let model = modelArray[indexRow]
        button.setBackgroundImage(UIImage.init(named: model.image ?? ""), for: .normal)
		let detailButton = (button.subviews.last as? UIButton) ?? {
			let detailButton = UIButton.init(frame: CGRect.zero)
			detailButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
			detailButton.setTitleColor(UIColor.white, for: .normal)
			detailButton.contentEdgeInsets = UIEdgeInsets.init(top: 3, left: 10, bottom: 3, right: 10)
			button.addSubview(detailButton)
			detailButton.snp.makeConstraints({ (maker) in
				maker.bottom.right.equalTo(0)
			})
			return detailButton
		}()
		detailButton.setTitle(model.text, for: .normal)
		var detailImage = UIImage.init(named: model.selectedImage ?? "")
		detailImage = detailImage?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 8, left: 8, bottom: 0, right: 0), resizingMode: .stretch)
		detailButton.setBackgroundImage(detailImage, for: .normal)
	}
	
	func buttonDidDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
		pageControl.currentPage = indexRow
	}
	
}
