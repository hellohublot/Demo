//
//  HTExerciseBackgroundView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTExerciseBackgroundView: UIView {
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.image = UIImage.init(named: "e120400ac34c17bf06308c5cbfb8ca7f")
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(imageView)
		imageView.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.top.equalTo(0)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadImageAnimationWithOffset(_ offset: CGFloat) {
//		imageView.snp.updateConstraints { (maker) in
//			maker.top.equalTo(-offset)
//		}
	}
	
}
