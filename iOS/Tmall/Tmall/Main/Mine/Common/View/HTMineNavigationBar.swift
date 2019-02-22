//
//  HTMineNavigationBar.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMineNavigationBar: UIView {
	
	lazy var backgroundView: UIView = {
		let backgroundView = UIView.init(frame: CGRect.zero)
		backgroundView.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
		backgroundView.alpha = 0
		return backgroundView
	}()
	
	lazy var contentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var setupBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "b6c3c615fda67f00d37c6273123294fa")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var messageBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "7c7bac77816fbb8b2e97d71c3497ba25")
		button.setImage(image, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(backgroundView)
		addSubview(contentView)
		addSubview(setupBarButton)
		addSubview(messageBarButton)
		backgroundView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		contentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
		}
		setupBarButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(5)
			maker.centerY.equalTo(contentView)
		}
		messageBarButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.centerY.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithImageOffset(_ offSet: CGFloat) {
		backgroundView.alpha = offSet / 64
	}
	
}
