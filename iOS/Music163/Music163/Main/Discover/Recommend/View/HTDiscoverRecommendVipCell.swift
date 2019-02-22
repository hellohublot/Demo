//
//  HTDiscoverRecommendVipCell.swift
//  Music163
//
//  Created by hublot on 2018/12/13.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendVipCell: UIView, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
        imageView.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		return imageView
	}()
	
	lazy var vipFlagButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
		button.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
		var image = UIImage.init(named: "94a1cfd6a1d37acedbd5c6187be57936")
		image = image?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15), resizingMode: .stretch)
		button.setBackgroundImage(image, for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 4, left: 3, bottom: 4, right: 3)
		button.setTitle("VIP专享", for: .normal)
		return button
	}()
	
	lazy var infoTypeButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
		button.setTitleColor(UIColor.white, for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 3, bottom: 2, right: 3)
		button.layer.borderWidth = 1 / UIScreen.main.scale
		button.layer.borderColor = UIColor.white.cgColor
		button.layer.masksToBounds = true
		button.layer.cornerRadius = 3
		return button
	}()
	
	lazy var infoTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 13)
		label.textColor = UIColor.white
		return label
	}()
	
	lazy var infoDetailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 13)
		label.textColor = UIColor.white
		label.alpha = 0.3
		return label
	}()
	
	lazy var nowPlayButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "b2e26b5d7dc4f9e118ac58f45e8d2d5d")
		button.setImage(image, for: .normal)
		button.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
		button.layer.masksToBounds = true
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		return label
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		nowPlayButton.layer.cornerRadius = nowPlayButton.bounds.size.height / 2.0
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.init(red: 0.14, green: 0.13, blue: 0.15, alpha: 1)
		layer.cornerRadius = 5
        layer.masksToBounds = true
		addSubview(backgroundImageView)
		addSubview(titleLabel)
		addSubview(vipFlagButton)
		addSubview(infoTypeButton)
		addSubview(infoTitleLabel)
		addSubview(infoDetailLabel)
		addSubview(nowPlayButton)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.top.left.right.equalTo(0)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.right.equalTo(-6)
			maker.top.equalTo(backgroundImageView.snp.bottom).offset(13)
			maker.bottom.equalTo(-13)
		}
		vipFlagButton.snp.makeConstraints { (maker) in
			maker.left.top.equalTo(backgroundImageView)
		}
		infoDetailLabel.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(backgroundImageView).offset(-6)
			maker.left.equalTo(6)
		}
		infoTypeButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.bottom.equalTo(infoDetailLabel.snp.top).offset(-3)
		}
		infoTitleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(infoTypeButton.snp.right).offset(2)
			maker.centerY.equalTo(infoTypeButton)
		}
		nowPlayButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.bottom.equalTo(backgroundImageView).offset(-10)
			maker.width.height.equalTo(36)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTDiscoverRecommendVipModel else {
			return
		}
		infoTypeButton.setTitle(model.infoType, for: .normal)
		infoTitleLabel.text = model.infoTitle
		infoDetailLabel.text = model.infoDetail
		titleLabel.text = model.title
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
		nowPlayButton.isHidden = !(model.infoShowPlay ?? false)
	}

}
