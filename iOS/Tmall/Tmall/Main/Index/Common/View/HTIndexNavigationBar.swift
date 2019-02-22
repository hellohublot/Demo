//
//  HTIndexNavigationBar.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTIndexNavigationBar: UIView {
	
	static let statusHeight: CGFloat = HTStatic.statusHeight
	
	static let navigationMinHeight: CGFloat = HTStatic.navigationHeight
	
	static let navigationSearchHeight: CGFloat = 44
	
	static let navigationMaxHeight: CGFloat = navigationMinHeight + navigationSearchHeight
	
	lazy var scanfBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "6e66abda12d9e8ae9e0b575348ee6d52")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var logoButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "ffda2af912cb39d85895a02f5c9c3f68")?.imageWith(zoom: 0.5)
		button.setImage(image, for: .normal)
		button.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		return button
	}()
	
	lazy var qrcodeBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "c84b49815846eabe85b3436e65e0193b")?.imageWith(zoom: 0.65)
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var messageBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "7c7bac77816fbb8b2e97d71c3497ba25")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var navigationBar: UIView = {
		let navigationBar = UIView.init(frame: CGRect.zero)
		return navigationBar
	}()
	
	lazy var searchView: HTIndexSearchView = {
		let searchView = HTIndexSearchView.init(frame: CGRect.zero)
		return searchView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		navigationBar.addSubview(scanfBarButton)
		navigationBar.addSubview(qrcodeBarButton)
		navigationBar.addSubview(messageBarButton)
		addSubview(searchView)
		addSubview(logoButton)
		addSubview(navigationBar)
				
		scanfBarButton.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(navigationBar)
			maker.left.equalTo(10)
		}
		logoButton.snp.makeConstraints { (maker) in
			maker.top.equalTo(type(of: self).statusHeight)
			maker.height.equalTo(type(of: self).navigationMinHeight - type(of: self).statusHeight - 8)
			maker.left.greaterThanOrEqualTo(scanfBarButton.snp.right).priority(999)
			maker.right.lessThanOrEqualTo(qrcodeBarButton.snp.left).priority(999)
		}
		qrcodeBarButton.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(scanfBarButton)
			maker.right.equalTo(messageBarButton.snp.left).offset(-10)
		}
		messageBarButton.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(scanfBarButton)
			maker.right.equalTo(-10)
		}
		navigationBar.snp.makeConstraints { (maker) in
			maker.top.equalTo(type(of: self).statusHeight)
			maker.height.equalTo(type(of: self).navigationMinHeight - type(of: self).statusHeight - 8)
			maker.left.right.equalTo(0)
		}
		searchView.snp.makeConstraints { (maker) in
			maker.top.equalTo(logoButton.snp.bottom).offset(10)
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
			maker.bottom.equalTo(-8)
		}
		
	}
	
	func reloadAnimatedWithHeight(_ barHeight: CGFloat) {
		let progress = 1 - (type(of: self).navigationMaxHeight - barHeight) / type(of: self).navigationSearchHeight
		
		backgroundColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1 - progress)
		logoButton.snp.updateConstraints { (maker) in
			maker.top.equalTo(type(of: self).statusHeight - type(of: self).navigationSearchHeight * (1 - progress))
		}
		logoButton.alpha = progress
		let leftEdge: CGFloat = 34
		let rightEdge = leftEdge * 2 + 5
		let halfProgress = (max(0.5, progress) - 0.5) / 0.5
		searchView.snp.updateConstraints { (maker) in
			maker.left.equalTo(10 + leftEdge * (1 -  halfProgress))
			maker.right.equalTo(-10 - rightEdge * (1 - halfProgress))
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
