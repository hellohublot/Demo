//
//  HTMusicPlayerProgressSlider.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerProgressSlider: UIView {

	lazy var currentLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.init(white: 1, alpha: 0.8)
		label.textAlignment = .center
		label.text = "00:00"
		return label
	}()

	lazy var progressSlider: UISlider = {
		let slider = UISlider.init(frame: CGRect.zero)
		slider.setThumbImage(UIImage.init(named: "ccd69dd642d348cffae7dbb6a68c892b")?.imageInsert(UIColor.clear, UIEdgeInsets.init(top: 1, left: 0, bottom: 0, right: 0)), for: .normal)
		slider.setMaximumTrackImage(UIImage.init(named: "9b8a279176b06066674552d0794370a6"), for: .normal)
		slider.setMinimumTrackImage(UIImage.init(named: "6cabc8c23540bdec11d71ccd8a9b7610"), for: .normal)
		return slider
	}()

	lazy var totalLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.init(white: 1, alpha: 0.8)
		label.textAlignment = .center
		label.text = "00:00"
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(currentLabel)
		addSubview(progressSlider)
		addSubview(totalLabel)
		currentLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.centerY.equalTo(progressSlider)
			maker.width.equalTo(36)
		}
		progressSlider.snp.makeConstraints { (maker) in
			maker.left.equalTo(currentLabel.snp.right).offset(6)
			maker.centerY.equalTo(self)
		}
		totalLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(progressSlider.snp.right).offset(6)
			maker.right.equalTo(-6)
			maker.width.equalTo(currentLabel)
			maker.centerY.equalTo(progressSlider)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
