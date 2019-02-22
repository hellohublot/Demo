//
//  HTDiscoverRecommendArticleCell.swift
//  Music163
//
//  Created by hublot on 2018/12/14.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendArticleCell: UICollectionViewCell, ReuseCell {
	
	lazy var separatorView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 1, alpha: 1)
		view.alpha = 0.02
		return view
	}()
	
	lazy var headImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.cornerRadius = 3
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setContentHuggingPriority(UILayoutPriority.init(99), for: .horizontal)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(99), for: .horizontal)
		button.setContentHuggingPriority(UILayoutPriority.init(99), for: .vertical)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(99), for: .vertical)
		button.isUserInteractionEnabled = false
		button.titleLabel?.numberOfLines = 2
		button.contentVerticalAlignment = .top
		button.contentHorizontalAlignment = .left
		return button
	}()
		
	lazy var playCountButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "0dd41ca51c240a85f037d6dd5c100450")?.imageTintColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12)), for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	lazy var replyCountButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "ac4a7a13af08e4f7bdb4ac9af7d329a9")?.imageTintColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12)), for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	lazy var separatorLine: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 1, alpha: 1)
		view.alpha = 0.05
		return view
	}()
	
	lazy var userImageButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
		button.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		button.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		button.contentHorizontalAlignment = .left
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	lazy var moreSheetButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "064e22d7dd9381e536eeed7d689927f0"), for: .normal)
		return button
	}()
	
	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
		view.isUserInteractionEnabled = false
		return view
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		userImageButton.imageView?.layer.cornerRadius = (userImageButton.imageView?.bounds.size.height ?? 0) / 2.0 
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(separatorView)
		contentView.addSubview(headImageView)
		contentView.addSubview(darkView)
		contentView.addSubview(titleButton)
		contentView.addSubview(playCountButton)
		contentView.addSubview(replyCountButton)
		contentView.addSubview(separatorLine)
		contentView.addSubview(userImageButton)
		contentView.addSubview(moreSheetButton)
		separatorView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(5)
		}
		headImageView.snp.makeConstraints { (maker) in
			maker.top.equalTo(separatorView.snp.bottom).offset(18)
			maker.width.height.equalTo(120)
			maker.left.equalTo(6)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(headImageView)
		}
		titleButton.snp.makeConstraints { (maker) in
			maker.top.equalTo(headImageView).offset(-8)
			maker.left.equalTo(headImageView.snp.right).offset(10)
			maker.right.equalTo(-8)
		}
		playCountButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleButton)
			maker.top.equalTo(titleButton.snp.bottom).offset(10)
		}
		replyCountButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(playCountButton.snp.right).offset(15)
			maker.centerY.equalTo(playCountButton)
		}
		separatorLine.snp.makeConstraints { (maker) in
			maker.top.equalTo(playCountButton.snp.bottom).offset(8)
			maker.left.equalTo(titleButton)
			maker.right.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
		userImageButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleButton)
			maker.top.equalTo(separatorLine.snp.bottom).offset(8)
			maker.bottom.equalTo(headImageView)
			maker.right.equalTo(moreSheetButton.snp.left).offset(-6)
		}
		moreSheetButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-8)
			maker.centerY.equalTo(userImageButton)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTDiscoverRecommendArticleModel else {
			return
		}
		headImageView.image = UIImage.init(named: model.image ?? "")
		let attributedString: NSAttributedString = {
			let font = UIFont.init(name: "PingFangSC-Medium", size: 17) ?? UIFont.init()
			let buttonImage: UIImage = {
				let button = UIButton.init(frame: CGRect.zero)
				button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
				button.setTitleColor(UIColor.init(red: 0.71, green: 0.18, blue: 0.17, alpha: 1), for: .normal)
				button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 3, bottom: 2, right: 3)
				button.setTitle(model.text, for: .normal)
				button.layer.cornerRadius = 2
				button.layer.masksToBounds = true
				button.layer.borderColor = UIColor.init(red: 159 / 255.0, green: 46 / 255.0, blue: 46 / 255.0, alpha: 1).cgColor
				button.layer.borderWidth = 1 / UIScreen.main.scale
				button.sizeToFit()
				return UIImage.from(button)
			}()
			let attachment = NSTextAttachment.init()
			attachment.image = buttonImage.imageInsert(UIColor.clear, UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 3))
			attachment.bounds = CGRect.init(x: 0, y: (font.ascender + font.descender - buttonImage.size.height) / 2.0, width: buttonImage.size.width, height: buttonImage.size.height)
			let attributedString = NSMutableAttributedString.init()
			attributedString.append(NSAttributedString.init(attachment: attachment))
			attributedString.append(NSAttributedString.init(string: model.title ?? "", attributes: [
				.font: font,
				.foregroundColor: UIColor.init(red: 1, green: 1, blue: 0.996078, alpha: 0.45)
			]))
			return attributedString
		}()
		titleButton.setAttributedTitle(attributedString, for: .normal)
		playCountButton.setTitle(model.playCount, for: .normal)
		replyCountButton.setTitle(model.replyCount, for: .normal)
		userImageButton.setImage(UIImage.init(named: model.userImage ?? "")?.imageWith(size: CGSize.init(width: 26, height: 26)), for: .normal)
		userImageButton.setTitle(model.userTitle, for: .normal)
	}
    
}
