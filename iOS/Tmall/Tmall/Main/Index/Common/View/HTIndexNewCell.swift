//
//  HTIndexNewCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/26.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexNewCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = UIColor.init(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
		label.setContentHuggingPriority(UILayoutPriority.init(902), for: .vertical)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(902), for: .vertical)
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
		label.setContentHuggingPriority(UILayoutPriority.init(901), for: .vertical)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(901), for: .vertical)
		return label
	}()
	
	lazy var descriptionLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)
		label.setContentHuggingPriority(UILayoutPriority.init(900), for: .vertical)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(900), for: .vertical)
		return label
	}()
	
	lazy var blackContentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var tryuseContentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var blackLeftBackgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		let image = UIImage.init(named: "d1a23374a5b3ef646eca8e5666c5abc5")
		imageView.image = image
		imageView.setContentHuggingPriority(UILayoutPriority.init(898), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(898), for: .vertical)
		return imageView
	}()
	
	lazy var blackLeftImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	lazy var blackLeftTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.init(red: 0.4, green: 0.42, blue: 0.46, alpha: 1)
		return label
	}()
	
	lazy var blackRightBackgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		let image = UIImage.init(named: "d1a23374a5b3ef646eca8e5666c5abc5")
		imageView.image = image
		imageView.setContentHuggingPriority(UILayoutPriority.init(899), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(899), for: .vertical)
		return imageView
	}()
	
	lazy var blackRightImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	lazy var blackRightTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.init(red: 0.4, green: 0.42, blue: 0.46, alpha: 1)
		return label
	}()
	
	lazy var tryuseBackgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var tryuseTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.white
		label.textAlignment = .center
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = UIColor.init(red: 248 / 255.0, green: 248 / 255.0, blue: 248 / 255.0, alpha: 1)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailLabel)
		contentView.addSubview(descriptionLabel)
		contentView.addSubview(blackContentView)
		contentView.addSubview(tryuseContentView)
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
			maker.top.equalTo(15)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.top.equalTo(titleLabel.snp.bottom).offset(5)
		}
		descriptionLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(detailLabel.snp.right).offset(3)
			maker.centerY.equalTo(detailLabel)
		}
		blackContentView.snp.makeConstraints { (maker) in
			maker.top.equalTo(detailLabel.snp.bottom).offset(5)
			maker.bottom.equalTo(0)
			maker.left.right.equalTo(0)
		}
		tryuseContentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(blackContentView)
		}
		
		
		blackContentView.addSubview(blackLeftImageView)
		blackContentView.addSubview(blackLeftBackgroundImageView)
		blackContentView.addSubview(blackLeftTitleLabel)
		blackContentView.addSubview(blackRightImageView)
		blackContentView.addSubview(blackRightBackgroundImageView)
		blackContentView.addSubview(blackRightTitleLabel)
		blackLeftBackgroundImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(5)
			maker.bottom.equalTo(0)
		}
		blackRightBackgroundImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(blackLeftBackgroundImageView.snp.right).offset(10)
			maker.width.equalTo(blackLeftBackgroundImageView)
			maker.right.equalTo(-5)
			maker.bottom.equalTo(blackLeftBackgroundImageView)
		}
		blackLeftTitleLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(blackLeftBackgroundImageView)
			maker.bottom.equalTo(-15)
		}
		blackRightTitleLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(blackRightBackgroundImageView)
			maker.bottom.equalTo(blackLeftTitleLabel)
		}
		blackLeftImageView.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(blackLeftBackgroundImageView)
			maker.width.equalTo(blackLeftBackgroundImageView).multipliedBy(0.95)
			maker.bottom.equalTo(blackLeftBackgroundImageView.snp.top).offset(30)
			maker.top.equalTo(3)
		}
		blackRightImageView.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(blackRightBackgroundImageView)
			maker.width.equalTo(blackLeftImageView)
			maker.bottom.equalTo(blackLeftImageView)
			maker.top.equalTo(blackLeftImageView)
		}
		
		tryuseContentView.addSubview(tryuseBackgroundImageView)
		tryuseContentView.addSubview(tryuseTitleLabel)
		tryuseBackgroundImageView.snp.makeConstraints { (maker) in
			maker.top.equalTo(10)
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
			maker.bottom.equalTo(-10)
		}
		tryuseTitleLabel.snp.makeConstraints { (maker) in
			maker.bottom.left.right.equalTo(tryuseBackgroundImageView)
			maker.height.equalTo(18)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexNewModel else {
			return
		}
		titleLabel.text = model.title
		detailLabel.text = model.detail
		descriptionLabel.text = model.text
		switch model.type {
		case .black?:
			blackContentView.isHidden = false
			tryuseContentView.isHidden = true
			blackLeftImageView.image = UIImage.init(named: model.leftImage ?? "")
			blackLeftTitleLabel.text = model.leftTitle
			blackRightImageView.image = UIImage.init(named: model.rightImage ?? "")
			blackRightTitleLabel.text = model.rightTitle
		case .tryuse?:
			tryuseContentView.isHidden = false
			blackContentView.isHidden = true
			tryuseBackgroundImageView.image = UIImage.init(named: model.leftImage ?? "")
			tryuseTitleLabel.text = model.leftTitle
		default:
			break
		}
	}
    
}
