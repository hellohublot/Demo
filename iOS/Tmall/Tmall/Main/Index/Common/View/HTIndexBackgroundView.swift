//
//  HTIndexBackgroundView.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTIndexBackgroundView: UIView {
	
	lazy var curveImageView: UIImageView = {
		let curveImageView = UIImageView.init()
		let image = UIImage.init(named: "7b6c43950eb1c7220a3b302d57d32070")
		curveImageView.image = image
		return curveImageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(curveImageView)
		curveImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(360)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithCurveImageTop(_ curveImageTop: CGFloat) {
		curveImageView.snp.updateConstraints { (maker) in
			maker.top.equalTo(curveImageTop)
		}
	}
	
}
