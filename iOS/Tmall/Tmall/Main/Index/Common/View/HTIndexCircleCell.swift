//
//  HTIndexCircleCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexCircleCell: UICollectionViewCell, ReuseCell {
	
	lazy var topImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		return imageView
	}()
	
	lazy var bottomTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10.5)
		label.textColor = UIColor.white
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(topImageView)
		contentView.addSubview(bottomTitleLabel)
		topImageView.snp.makeConstraints { (maker) in
			maker.top.equalTo(3)
			maker.centerX.equalTo(contentView)
		}
		bottomTitleLabel.snp.makeConstraints { (maker) in
			maker.top.equalTo(topImageView.snp.bottom).offset(4)
			maker.centerX.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexCircleModel else {
			return
		}
		bottomTitleLabel.text = model.title
		let image = UIImage.init(named: model.image ?? "")
		topImageView.image = image

	}
    
}
