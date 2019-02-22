//
//  HTCourseBackgroundView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTCourseBackgroundView: UIView {
    
    static let imageBlueHeight: CGFloat = 140
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFill
        let image = UIImage.init(named: "522b88093f43ed5252a4c2322d4edd93")
        imageView.image = image
        return imageView
    }()
	
	lazy var whiteView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.white
		return view
	}()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
		addSubview(whiteView)
        imageView.snp.makeConstraints { (maker) in
            maker.left.right.top.equalTo(0)
            maker.height.equalTo(0)
        }
		whiteView.snp.makeConstraints { (maker) in
			maker.top.equalTo(0)
			maker.bottom.left.right.equalTo(0)
		}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadHeaderImageViewWithOffset(_ offset: CGFloat) {
		let height = max(0, type(of: self).imageBlueHeight + 100 - offset)
		whiteView.snp.updateConstraints { (maker) in
			maker.top.equalTo(type(of: self).imageBlueHeight + 115 + 38 - offset)
		}
        imageView.snp.updateConstraints { (maker) in
            maker.height.equalTo(height)
        }
    }
    
}
