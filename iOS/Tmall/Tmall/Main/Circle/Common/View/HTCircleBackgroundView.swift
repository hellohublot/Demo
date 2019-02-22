//
//  HTCircleBackgroundView.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTCircleBackgroundView: UIView {
	
	static let headerImageHeight = 240

	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		let image = UIImage.init(named: "ed960fe5b9e3500eb890e59ad0d2d35e")
		imageView.image = image
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(imageView)
		imageView.snp.makeConstraints { (maker) in
			maker.top.left.right.equalTo(0)
			maker.height.equalTo(type(of: self).headerImageHeight)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithImageTop(_ imageTop: CGFloat) {
		imageView.snp.updateConstraints { (maker) in
			maker.top.equalTo(imageTop)
		}
	}
	
}
