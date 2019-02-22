//
//  HTMusicPlayerLyricVolmeSlider.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerLyricVolumeSlider: UIView {

	lazy var imageButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "cc4c0978ddcecb5189936fd25994e420")
		button.setImage(image, for: .normal)
		return button
	}()

	lazy var volumeSlider: UISlider = {
		let slider = UISlider.init(frame: CGRect.zero)
		slider.setThumbImage(UIImage.init(named: "873c086bf58940f6e5bbe3304a4a2432")?.imageInsert(UIColor.clear, UIEdgeInsets.init(top: 1, left: 0, bottom: 0, right: 0)), for: .normal)
		slider.setMaximumTrackImage(UIImage.init(named: "9c8a996a5a710a8fb79eb38cb8f5a649"), for: .normal)
		slider.setMinimumTrackImage(UIImage.init(named: "492fe73d140c2552639c5be4f8b218ec"), for: .normal)
		return slider
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(imageButton)
		addSubview(volumeSlider)
		imageButton.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(self)
			maker.left.equalTo(0)
			maker.width.equalTo(28)
		}
		volumeSlider.snp.makeConstraints { (maker) in
			maker.left.equalTo(imageButton.snp.right)
			maker.centerY.equalTo(self)
			maker.right.equalTo(0)
			maker.height.equalTo(28)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
