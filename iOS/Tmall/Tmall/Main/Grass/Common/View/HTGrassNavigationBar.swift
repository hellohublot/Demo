//
//  HTGrassNavigationBar.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTGrassNavigationBar: UIView {
	
	static let navigationHeight: CGFloat = HTStatic.navigationHeight
	
	lazy var contentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()

	lazy var personBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "9c2b347f2f25d91807134878d51c46b4")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.textColor = UIColor.white
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.text = "种草猫"
		return label
	}()
	
	lazy var messageBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "7c7bac77816fbb8b2e97d71c3497ba25")
		button.setImage(image, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(contentView)
		contentView.addSubview(personBarButton)
		contentView.addSubview(titleLabel)
		contentView.addSubview(messageBarButton)
		contentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
		}
		personBarButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.centerY.equalTo(contentView)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.center.equalTo(contentView)
		}
		messageBarButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.centerY.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithOffset(_ offsetY: CGFloat) {
		let progress = max(0, min(offsetY / type(of: self).navigationHeight, 1))
		backgroundColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: progress)
		titleLabel.alpha = progress
	}
	
}
