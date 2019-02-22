//
//  HTVideoContentCell.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTVideoContentCell: UITableViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = 5
		imageView.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		return imageView
	}()
	
	lazy var playerView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.layer.masksToBounds = true
		return view
	}()
	
	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.isUserInteractionEnabled = false
		return view
	}()
	
	lazy var playVideoButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "abb2f04a7204c88f62f6652ce2456b9b")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var topGradientImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "5196d9a7a5f9669827be0642743e0f16")
		imageView.image = image
		return imageView
	}()
	
	lazy var bottomGradientImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "c19d19ae53b8b80745801a975f091838")
		imageView.image = image
		return imageView
	}()
	
	lazy var playCountButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "5642f763ef5056e2e6c415fd961e9d65")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.white, for: .normal)
		return button
	}()
	
	lazy var videoDurationButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "be299219d745babe1829258a038ef2ee")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.white, for: .normal)
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.init(name: "PingFangSC-Medium", size: 16)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		label.alpha = 0.6
		return label
	}()
	
	lazy var separatorLine: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05)
		return view
	}()
	
	lazy var userButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
		button.imageView?.layer.masksToBounds = true
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	lazy var likeCountImageView: UIImageView = {
		let button = UIImageView.init(frame: CGRect.zero)
		let image = UIImage.init(named: "5afa3f4eb21ff1b713026485f1770d80")?.imageTintColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25))
		button.image = image
		return button
	}()
	
	lazy var likeCountLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 9)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25)
		return label
	}()
	
	lazy var replyCountImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		let image = UIImage.init(named: "8e716c4ca35f6581b514730551185f07")?.imageTintColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25))
		imageView.image = image
		return imageView
	}()
	
	lazy var replyCountLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 9)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25)
		return label
	}()
	
	lazy var moreActionButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "5617fa1f6f84dd8946f8fe27078fa91d")?.imageTintColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25))
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var separatorView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.white
		view.alpha = 0.02
		return view
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		userButton.imageView?.layer.cornerRadius = (userButton.imageView?.bounds.size.height ?? 0) / 2.0
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = UIColor.clear
		selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
		contentView.addSubview(playerView)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(playerView)
		backgroundImageView.addSubview(darkView)
		backgroundImageView.addSubview(playVideoButton)
		backgroundImageView.addSubview(topGradientImageView)
		backgroundImageView.addSubview(bottomGradientImageView)
		backgroundImageView.addSubview(playCountButton)
		backgroundImageView.addSubview(videoDurationButton)
		contentView.addSubview(titleLabel)
		contentView.addSubview(separatorLine)
		addSubview(userButton)
		contentView.addSubview(likeCountImageView)
		contentView.addSubview(likeCountLabel)
		contentView.addSubview(replyCountImageView)
		contentView.addSubview(replyCountLabel)
		contentView.addSubview(moreActionButton)
		contentView.addSubview(separatorView)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.right.equalTo(-6)
			maker.top.equalTo(6)
		}
		playerView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
		playVideoButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
		topGradientImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
		}
		bottomGradientImageView.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.top.equalTo(topGradientImageView.snp.bottom)
			maker.bottom.equalTo(0)
			maker.height.equalTo(topGradientImageView)
		}
		playCountButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.bottom.equalTo(-10)
		}
		videoDurationButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-6)
			maker.bottom.equalTo(playCountButton)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(backgroundImageView)
			maker.top.equalTo(backgroundImageView.snp.bottom).offset(10)
			maker.right.equalTo(backgroundImageView)
		}
		separatorLine.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(backgroundImageView)
			maker.top.equalTo(titleLabel.snp.bottom).offset(10)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
		userButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(backgroundImageView)
			maker.top.equalTo(separatorLine.snp.bottom)
			maker.height.equalTo(50)
		}
		likeCountImageView.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(userButton)
			maker.right.equalTo(replyCountImageView.snp.left).offset(-40)
		}
		likeCountLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(likeCountImageView.snp.right).offset(-5)
			maker.top.equalTo(likeCountImageView).offset(-4)
		}
		replyCountImageView.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(userButton)
			maker.right.equalTo(moreActionButton.snp.left).offset(-40)
		}
		replyCountLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(replyCountImageView.snp.right).offset(-7)
			maker.top.equalTo(replyCountImageView).offset(-4)
		}
		moreActionButton.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(userButton)
			maker.right.equalTo(backgroundImageView)
		}
		separatorView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.top.equalTo(userButton.snp.bottom)
			maker.height.equalTo(5)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTVideoContentModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
		playCountButton.setTitle(model.playCount, for: .normal)
		videoDurationButton.setTitle(model.videoDuration, for: .normal)
		titleLabel.text = model.title
		userButton.setImage(UIImage.init(named: model.userImage ?? "")?.imageWith(size: CGSize.init(width: 30, height: 30)), for: .normal)
		userButton.setTitle(model.userTitle, for: .normal)
		likeCountLabel.text = model.likeCount
		replyCountLabel.text = model.replyCount
	}

}
