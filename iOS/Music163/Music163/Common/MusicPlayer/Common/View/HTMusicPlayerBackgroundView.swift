//
//  HTMusicPlayerBackgroundView.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerBackgroundView: UIView {

	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "6fe9e22d67b2ac17c59be58e42c9ec6d")
		imageView.image = image
		imageView.backgroundColor = UIColor.init(red: 0.09, green: 0.09, blue: 0.09, alpha: 1)

		let alphaList: [CGFloat] = [0.3, 0.2]
		for alpha in alphaList {
			let alphaView = UIView.init(frame: CGRect.zero)
			alphaView.backgroundColor = UIColor.init(white: 0, alpha: alpha)
			imageView.addSubview(alphaView)
			alphaView.snp.makeConstraints({ (maker) in
				maker.edges.equalTo(UIEdgeInsets.zero)
			})
		}

		let darkImageView = UIImageView.init(frame: CGRect.zero)
		let darkImage = UIImage.init(named: "b0f00803a863f28154a2e91fe7590085")
		darkImageView.contentMode = .scaleToFill
		darkImageView.layer.masksToBounds = true
		darkImageView.image = darkImage
		imageView.addSubview(darkImageView)
		darkImageView.snp.makeConstraints({ (maker) in
			maker.left.top.right.equalTo(0)
			maker.height.equalTo(115)
		})
		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(backgroundImageView)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
