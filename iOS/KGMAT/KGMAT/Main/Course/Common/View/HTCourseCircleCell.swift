//
//  HTCourseCircleCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseCircleCell: UICollectionViewCell, ReuseCell {
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(imageView)
		contentView.addSubview(titleLabel)
		imageView.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(15)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(imageView.snp.bottom).offset(10)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCourseCircleModel else {
			return
		}
		imageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
	}
	
}
