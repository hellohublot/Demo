//
//  HTMusicPlayerImageBarItem.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerImageBarItem: UIView {
	
	let imageHeight: CGFloat = 26
	
	lazy var titleImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = imageHeight / 2.0
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "6e74bd3604bf983067f23e0567a8b5f8")
		imageView.image = image
		return imageView
	}()

	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.white, for: .normal)
		button.setTitle("关注", for: .normal)
		button.setImage(UIImage.init(named: "c685c6b9e2f12b1ba4b1ec8d5f08794c"), for: .normal)
		button.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.1)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: imageHeight + 8, bottom: 0, right: imageHeight / 2.0)
		button.layer.cornerRadius = imageHeight / 2.0
		button.layer.masksToBounds = true
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleButton)
		titleButton.addSubview(titleImageView)
		titleButton.snp.makeConstraints { (maker) in
			maker.center.equalTo(self)
			maker.height.equalTo(imageHeight)
		}
		titleImageView.snp.makeConstraints { (maker) in
			maker.width.height.equalTo(imageHeight)
			maker.left.top.equalTo(0)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var intrinsicContentSize: CGSize {
		let width = titleButton.intrinsicContentSize.width
		return CGSize.init(width: width, height: HTStatic.navigationHeight - HTStatic.statusHeight)
	}
	
}
