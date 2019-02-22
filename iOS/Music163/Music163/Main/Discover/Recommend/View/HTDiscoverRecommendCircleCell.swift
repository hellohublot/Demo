//
//  HTDiscoverRecommendCircleCell.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendCircleCell: UICollectionViewCell, ReuseCell {
	
	lazy var topImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.backgroundColor = UIColor.init(red: 68 / 255.0, green: 68 / 255.0, blue: 71 / 255.0, alpha: 1)
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var topTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 0.65, green: 0.65, blue: 0.66, alpha: 1)
		return label
	}()
	
	lazy var bottomTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		return label
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		topImageView.layer.cornerRadius = topImageView.bounds.size.height / 2.0
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(topImageView)
		addSubview(topTitleLabel)
		addSubview(bottomTitleLabel)
		topImageView.snp.makeConstraints { (maker) in
			maker.top.equalTo(17)
			maker.width.height.equalTo(50)
			maker.centerX.equalTo(contentView)
		}
		topTitleLabel.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(topImageView).offset(3)
            maker.centerX.equalTo(topImageView)
		}
		bottomTitleLabel.snp.makeConstraints { (maker) in
			maker.top.equalTo(topImageView.snp.bottom).offset(6)
			maker.centerX.equalTo(topImageView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTDiscoverRecommendCircleModel else {
			return
		}
		topImageView.image = UIImage.init(named: model.image ?? "")
		bottomTitleLabel.text = model.title
		topTitleLabel.text = model.text
	}
    
}
