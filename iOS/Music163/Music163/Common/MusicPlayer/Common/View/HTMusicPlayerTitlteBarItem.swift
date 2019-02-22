//
//  HTMusicPlayerTitlteBarItem.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerTitlteBarItem: UIView {

	lazy var musicNameLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.init(white: 1, alpha: 0.8)
		label.text = "一个人的朝圣"
		return label
	}()
	
	lazy var singerNameButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .normal)
		let image = UIImage.init(named: "2d980ec5c463cf8f3429898249ae87f3")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -3)
		button.setTitle("徐大乐", for: .normal)
		return button
	}()
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(musicNameLabel)
		addSubview(singerNameButton)
		musicNameLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(0)
			maker.top.equalTo(4)
		}
		singerNameButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(musicNameLabel)
			maker.bottom.equalTo(-4)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var intrinsicContentSize: CGSize {
		let musicNameSize = musicNameLabel.intrinsicContentSize
		let singerNameSize = singerNameButton.intrinsicContentSize
		let width = max(musicNameSize.width, singerNameSize.width)
		return CGSize.init(width: width, height: HTStatic.navigationHeight - HTStatic.statusHeight)
	}
	
}
