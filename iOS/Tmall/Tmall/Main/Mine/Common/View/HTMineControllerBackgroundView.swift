//
//  HTMineBackgroundView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMineControllerBackgroundView: UIView {
	
	lazy var backgroundImageView: UIView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "03f1546fa3108dde252f95055b45dfc7")?.imageWith(zoom: 0.5)
		imageView.image = image
		imageView.backgroundColor = UIColor.init(red: 1, green: 39 / 255.0, blue: 56 / 255.0, alpha: 1)
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(backgroundImageView)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(400)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
