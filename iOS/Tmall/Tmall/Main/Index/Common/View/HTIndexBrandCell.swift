//
//  HTIndexBrandCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/26.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexBrandCell: UICollectionViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	lazy var logoImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = UIColor.init(red: 248 / 255.0, green: 248 / 255.0, blue: 248 / 255.0, alpha: 1)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(logoImageView)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.top.equalTo(5)
			maker.centerX.equalTo(contentView)
			maker.width.equalTo(contentView).multipliedBy(0.65)
			maker.height.equalTo(contentView).multipliedBy(0.5)
		}
		logoImageView.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-10)
			maker.left.right.equalTo(backgroundImageView)
			maker.top.equalTo(backgroundImageView.snp.bottom).offset(15)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexBrandModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.backgroundImage ?? "")
		logoImageView.image = UIImage.init(named: model.image ?? "")
	}
    
}
