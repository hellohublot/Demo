//
//  HTIndexGoodCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/26.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexGoodCell: UICollectionViewCell, ReuseCell {
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		return imageView
	}()
	
	lazy var storeButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.backgroundColor = UIColor.init(red: 207 / 255.0, green: 174 / 255.0, blue: 165 / 255.0, alpha: 1)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
		button.setTitleColor(UIColor.white, for: .normal)
		button.layer.cornerRadius = 2
		button.layer.masksToBounds = true
		button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 3, bottom: 2, right: 3)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = UIColor.init(red: 0.24, green: 0.24, blue: 0.24, alpha: 1)
		label.numberOfLines = 2
		return label
	}()
	
	lazy var priceLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.textColor = UIColor.red
		label.font = UIFont.boldSystemFont(ofSize: 15)
		return label
	}()
	
	lazy var fromButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.contentHorizontalAlignment = .left
		button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
		button.setTitleColor(UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
		button.setTitle("精选", for: .normal)
		return button
	}()
	
	lazy var discoverButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "b0d9e2c5b07746fa80b945d5aabafb1c")?.imageWith(zoom: 0.5)
		button.setImage(image, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = UIColor.init(red: 248 / 255.0, green: 248 / 255.0, blue: 248 / 255.0, alpha: 1)
		contentView.layer.cornerRadius = 5
		contentView.layer.masksToBounds = true
		contentView.addSubview(imageView)
		contentView.addSubview(storeButton)
		contentView.addSubview(titleLabel)
		contentView.addSubview(priceLabel)
		contentView.addSubview(fromButton)
		contentView.addSubview(discoverButton)
		imageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
			maker.top.equalTo(10)
		}
		storeButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(imageView).offset(5)
			maker.bottom.equalTo(imageView).offset(5)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(storeButton)
			maker.right.equalTo(-5)
			maker.top.equalTo(storeButton.snp.bottom).offset(5)
		}
		priceLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(storeButton)
			maker.top.equalTo(titleLabel.snp.bottom).offset(8)
		}
		fromButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(storeButton)
			maker.top.equalTo(priceLabel.snp.bottom).offset(5)
			maker.bottom.equalTo(-5)
		}
		discoverButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-5)
			maker.centerY.equalTo(fromButton)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexGoodModel else {
			return
		}
		imageView.image = UIImage.init(named: model.image ?? "")
		storeButton.setImage(UIImage.init(named: model.storeImage ?? "")?.imageWith(zoom: 0.5), for: .normal)
		storeButton.setTitle(model.storeTitle, for: .normal)
		titleLabel.text = model.title
		priceLabel.text = model.price
	}
    
}
