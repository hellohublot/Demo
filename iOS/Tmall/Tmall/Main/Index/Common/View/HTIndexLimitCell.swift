//
//  HTIndexLimitCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexLimitCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = UIColor.init(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        label.setContentHuggingPriority(UILayoutPriority.init(900), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(900), for: .vertical)
		return label
	}()
	
	lazy var leftImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var leftButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.cornerRadius = 2
		button.layer.borderWidth = 1
		button.layer.masksToBounds = true
		button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
		return button
	}()
	
	lazy var rightImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var rightButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.cornerRadius = 2
		button.layer.borderWidth = 1
		button.layer.masksToBounds = true
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = UIColor.init(red: 248 / 255.0, green: 248 / 255.0, blue: 248 / 255.0, alpha: 1)
		contentView.addSubview(titleLabel)
		contentView.addSubview(leftImageView)
		contentView.addSubview(rightImageView)
		contentView.addSubview(leftButton)
		contentView.addSubview(rightButton)
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.top.equalTo(15)			
		}
		leftImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(0)
			maker.right.equalTo(rightImageView.snp.left)
			maker.top.equalTo(titleLabel.snp.bottom).offset(10)
			maker.bottom.equalTo(-20)
		}
		rightImageView.snp.makeConstraints { (maker) in
			maker.right.equalTo(0)
			maker.top.equalTo(leftImageView)
			maker.bottom.equalTo(leftImageView)
		}
		leftButton.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-10)
			maker.centerX.equalTo(leftImageView)
            maker.height.equalTo(15)
		}
		rightButton.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-10)
			maker.centerX.equalTo(rightImageView)
            maker.height.equalTo(leftButton)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexLimitModel else {
			return
		}
		titleLabel.text = model.title
		let leftImage = UIImage.init(named: model.leftImage ?? "")
		let rightImage = UIImage.init(named: model.rightImage ?? "")
		leftImageView.image = leftImage
		rightImageView.image = rightImage
		leftButton.setTitle(model.leftTitle, for: .normal)
		rightButton.setTitle(model.rightTitle, for: .normal)
		
		var textColor = UIColor.white
		var borderColor = UIColor.clear
		var backgroundColor = UIColor.orange
		switch model.type {
		case .time?:
			textColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
			backgroundColor = UIColor.init(red: 1, green: 0.93, blue: 0.95, alpha: 1)
			borderColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
		case .better?:
			textColor = UIColor.white
			backgroundColor = UIColor.init(red: 0.76, green: 0.59, blue: 0.45, alpha: 1)
			borderColor = UIColor.clear
		default:
			break
		}
		leftButton.setTitleColor(textColor, for: .normal)
		leftButton.layer.borderColor = borderColor.cgColor
		leftButton.backgroundColor = backgroundColor
		rightButton.setTitleColor(textColor, for: .normal)
		rightButton.layer.borderColor = borderColor.cgColor
		rightButton.backgroundColor = backgroundColor

	}
}
