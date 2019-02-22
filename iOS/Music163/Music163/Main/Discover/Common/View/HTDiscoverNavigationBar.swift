//
//  HTDiscoverNavigationBar.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverNavigationBar: UIView {
	
	static let navigationBarHeight: CGFloat = HTStatic.navigationHeight + 40
	
	lazy var blurEffectView: UIVisualEffectView = {
		let blueEffectView = UIVisualEffectView.init(frame: CGRect.zero)
		blueEffectView.effect = UIBlurEffect.init(style: UIBlurEffectStyle.dark)
		return blueEffectView
	}()
	
	lazy var navigationContentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var voiceButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "7afbe08861374d11b948957ba0cedbf7")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var searchButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "6dc02b4963f5e1791a488a991cc409b9")
		button.setImage(image, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.2), for: .normal)
		button.setTitle("Take Me Hand 很好听哦", for: .normal)
		button.backgroundColor = UIColor.init(white: 1, alpha: 0.06)
		button.layer.masksToBounds = true
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
		return button
	}()
	
	lazy var pageHeaderView: HTPageHeaderView = {
		let pageHeaderView = HTPageHeaderView.init(frame: CGRect.zero)
		return pageHeaderView
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		searchButton.layer.cornerRadius = searchButton.bounds.size.height / 2.0
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(blurEffectView)
		blurEffectView.contentView.addSubview(navigationContentView)
		navigationContentView.addSubview(voiceButton)
		addSubview(searchButton)
		blurEffectView.contentView.addSubview(pageHeaderView)
		blurEffectView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		navigationContentView.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(self)
			maker.top.equalTo(HTStatic.statusHeight)
			maker.height.equalTo(HTStatic.navigationHeight - HTStatic.statusHeight)
		}
		voiceButton.snp.makeConstraints { (maker) in
			maker.width.equalTo(HTTabbarController.playContentWidth)
			maker.left.top.bottom.equalTo(navigationContentView)
		}
		searchButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(voiceButton.snp.right).offset(5)
			maker.right.equalTo(-HTTabbarController.playContentWidth - 5)
			maker.top.equalTo(navigationContentView).offset(7)
			maker.bottom.equalTo(navigationContentView).offset(-7)
		}
		pageHeaderView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.top.equalTo(navigationContentView.snp.bottom)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
