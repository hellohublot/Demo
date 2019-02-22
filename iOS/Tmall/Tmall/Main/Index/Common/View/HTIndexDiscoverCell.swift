//
//  HTIndexDiscoverCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexDiscoverCell: UICollectionViewCell, ReuseCell {
    
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var darkContentView: UIView = {
		let darkContentView = UIView.init(frame: CGRect.zero)
		darkContentView.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
		return darkContentView
	}()
	
	lazy var logoImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.white
		return label
	}()
	
	lazy var firstTagButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
		button.backgroundColor = UIColor.init(white: 0, alpha: 0.25)
		button.setTitleColor(UIColor.white, for: .normal)
		button.layer.cornerRadius = 2
		button.layer.masksToBounds = true
		button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
		return button
	}()
	
	lazy var secondTagButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
		button.backgroundColor = UIColor.init(white: 0, alpha: 0.25)
		button.setTitleColor(UIColor.white, for: .normal)
		button.layer.cornerRadius = 2
		button.layer.masksToBounds = true
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(darkContentView)
		contentView.addSubview(logoImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(firstTagButton)
		contentView.addSubview(secondTagButton)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		darkContentView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.height.equalTo(contentView).multipliedBy(0.5)
		}
		firstTagButton.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-3)
			maker.left.equalTo(5)
            maker.height.equalTo(14)
		}
		secondTagButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(firstTagButton.snp.right).offset(1)
			maker.bottom.equalTo(firstTagButton)
            maker.height.equalTo(firstTagButton)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(firstTagButton.snp.top).offset(-4)
			maker.left.equalTo(firstTagButton)
			maker.right.equalTo(contentView).offset(-5)
		}
		logoImageView.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(titleLabel.snp.top).offset(-4)
			maker.left.equalTo(firstTagButton)
			maker.right.equalTo(contentView).offset(-5)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexDiscoverModel else {
			return
		}
		let backgroundImage = UIImage.init(named: model.backgroundImage ?? "")
		backgroundImageView.image = backgroundImage
		let logoImage = UIImage.init(named: model.image ?? "")
		logoImageView.image = logoImage
		titleLabel.text = model.title
		firstTagButton.setTitle(model.tagList?.first, for: .normal)
		secondTagButton.setTitle(model.tagList?.last, for: .normal)
	}
	
}
