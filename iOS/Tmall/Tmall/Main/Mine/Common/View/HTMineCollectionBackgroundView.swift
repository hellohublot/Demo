//
//  HTMineCollectionBackgroundView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMineCollectionBackgroundView: UIView {

	static let headerContentHeight: CGFloat = 180
	
	lazy var contentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var whiteView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.white
		return view
	}()
	
	lazy var headImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "ab660433349321b938594d14e0ac5ee5")
		imageView.image = image
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.text = "hublot"
		label.textColor = UIColor.white
		label.font = UIFont.systemFont(ofSize: 20)
		return label
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setTitle("账户防护中 >", for: .normal)
		button.backgroundColor = UIColor.init(white: 0, alpha: 0.41)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
		button.setTitleColor(UIColor.init(red: 1, green: 0.67, blue: 0.12, alpha: 1), for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 3, left: 6, bottom: 3, right: 6)
		return button
	}()
	
	lazy var playValueImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "5887fa1fde6c5bc2403e6650180bc045")?.imageWith(zoom: 0.7)
		imageView.image = image
		return imageView
	}()
	
	lazy var playValueLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.white
		label.text = "淘气值 502"
		return label
	}()
	
	lazy var vipImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "733108c12faebe51f5be51dabcda6e5e")
		imageView.image = image
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(contentView)
		addSubview(whiteView)
		contentView.addSubview(headImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailButton)
		contentView.addSubview(playValueImageView)
		contentView.addSubview(playValueLabel)
		contentView.addSubview(vipImageView)
		
		contentView.snp.makeConstraints { (maker) in
			maker.top.left.right.equalTo(0)
			maker.height.equalTo(type(of: self).headerContentHeight)
		}
		whiteView.snp.makeConstraints { (maker) in
			maker.bottom.left.right.equalTo(0)
			maker.top.equalTo(contentView.snp.bottom)
		}
		headImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.top.equalTo(30)
			maker.width.height.equalTo(80)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(headImageView.snp.right).offset(10)
			maker.top.equalTo(headImageView).offset(10)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.top.equalTo(titleLabel.snp.bottom).offset(8)
		}
		playValueImageView.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.centerY.equalTo(headImageView)
		}
		playValueLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(playValueImageView)
			maker.bottom.equalTo(playValueImageView).offset(-5)
		}
		vipImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
			maker.bottom.equalTo(7)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadAnimatedWithContentTop(_ contentTop: CGFloat) {
		contentView.snp.updateConstraints { (maker) in
			maker.top.equalTo(contentTop)
		}
	}
	
}
