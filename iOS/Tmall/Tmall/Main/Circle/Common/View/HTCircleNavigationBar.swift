//
//  HTCircleNavigationBar.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTCircleNavigationBar: UIView {
	
	static let navigationHeight = HTStatic.navigationHeight
	
	lazy var backgroundView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
		view.alpha = 0
		return view
	}()
	
	lazy var contentView: UIView = {
		let contentView = UIView.init(frame: CGRect.zero)
		return contentView
	}()

	lazy var activityLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.text = "我报名的活动"
		label.textColor = UIColor.white
		label.font = UIFont.systemFont(ofSize: 12)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(backgroundView)
		addSubview(contentView)
		contentView.addSubview(activityLabel)
		backgroundView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		contentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
		}
		activityLabel.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.centerY.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithImageTop(_ imageTop: CGFloat) {
		backgroundView.alpha = (imageTop - 50) / 80
	}
	
}
