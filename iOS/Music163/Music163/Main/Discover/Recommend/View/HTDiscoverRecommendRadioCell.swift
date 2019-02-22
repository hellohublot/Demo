//
//  HTDiscoverRecommendRadioCell.swift
//  Music163
//
//  Created by hublot on 2018/12/14.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendRadioCell: UICollectionViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.layer.masksToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 3
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var detailDarkImageView: UIImageView = {
		let darkImageView = UIImageView.init(frame: CGRect.zero)
		darkImageView.layer.masksToBounds = true
		let image = UIImage.init(named: "abd1cfb32ee97103811a1dc88a717ad8")
		darkImageView.image = image
		return darkImageView
	}()
	
	lazy var flagTitleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
		button.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
		var image = UIImage.init(named: "e46aa545f67851b78a649da0484ea36f")
		image = image?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10), resizingMode: .stretch)
		button.setBackgroundImage(image, for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 3, left: 5, bottom: 3, right: 5)
		return button
	}()
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
		button.contentHorizontalAlignment = .left
		button.contentVerticalAlignment = .top
		button.titleLabel?.lineBreakMode = .byTruncatingTail
		button.titleLabel?.numberOfLines = 2
		return button
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 13)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		return label
	}()
	
	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
		view.isUserInteractionEnabled = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(flagTitleButton)
		contentView.addSubview(detailDarkImageView)
		contentView.addSubview(darkView)
		contentView.addSubview(titleButton)
		contentView.addSubview(detailLabel)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.bottom.equalTo(titleButton.snp.top).offset(-3)
		}
		detailDarkImageView.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.bottom.equalTo(backgroundImageView)
			maker.height.equalTo(28)
		}
		flagTitleButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(backgroundImageView)
			maker.top.equalTo(backgroundImageView)
		}
		titleButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(3)
			maker.right.equalTo(-3)
			maker.height.equalTo(32)
			maker.bottom.equalTo(-8)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(backgroundImageView).offset(-3)
			maker.left.equalTo(backgroundImageView).offset(3)
			maker.right.equalTo(backgroundImageView).offset(-3)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTDiscoverRecommendRadioModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
		titleButton.setTitle(model.title, for: .normal)
		detailLabel.text = model.text
		flagTitleButton.isHidden = (model.flagTitle?.count ?? 0) <= 0
		flagTitleButton.setTitle(model.flagTitle, for: .normal)
	}

	
}
