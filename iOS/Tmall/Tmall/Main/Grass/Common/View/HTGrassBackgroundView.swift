//
//  HTGrassBackgroundView.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTGrassBackgroundView: UIView {
	
	static let backgroundHeaderHeight: CGFloat = 220

	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		let image = UIImage.init(named: "2053e6fc36298b6125808ebf7505442e")
		imageView.image = image
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		let image = UIImage.init(named: "46f87b99c51969c7d08b2b191ebd8d42")?.imageWith(zoom: 0.7)
		imageView.image = image
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = UIColor.white
		label.text = "开启理想生活"
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = UIColor.white
		label.text = "邀您一起"
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(backgroundImageView)
		backgroundImageView.addSubview(imageView)
		backgroundImageView.addSubview(titleLabel)
		backgroundImageView.addSubview(detailLabel)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.top.right.equalTo(0)
			maker.height.equalTo(type(of: self).backgroundHeaderHeight)
		}
		imageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.bottom.equalTo(titleLabel.snp.top).offset(-12)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(imageView)
			maker.bottom.equalTo(detailLabel.snp.top).offset(-8)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(imageView)
			maker.bottom.equalTo(-15)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithImageTop(_ imageTop: CGFloat) {
		backgroundImageView.snp.updateConstraints { (maker) in
			maker.top.equalTo(imageTop)
		}
	}
	
}
