//
//  HTMusicPlayerControlBar.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerControlBar: UIView {

	static let controlBarHeight: CGFloat = 117

	lazy var progressSlider: HTMusicPlayerProgressSlider = {
		let progressSlider = HTMusicPlayerProgressSlider.init(frame: CGRect.zero)
		return progressSlider
	}()

	lazy var playLoopButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "47b6133fe7ea55bf31db8cc4d129b7ae"), for: .normal)
		return button
	}()

	lazy var lastSongButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "f6f5450de906379c5956da1d2b6aaf30"), for: .normal)
		return button
	}()

	lazy var playControlButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let normalImage = UIImage.init(named: "16c3d38c3454103cb5ae22a682eec5d2")
		let selectedImage = UIImage.init(named: "e454ce3a181334dfe506af6da7c16950")
		button.setImage(normalImage, for: .normal)
		button.setImage(normalImage, for: [.normal, .highlighted])
		button.setImage(selectedImage, for: .selected)
		button.setImage(selectedImage, for: [.selected, .highlighted])
		return button
	}()

	lazy var nextSongButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "598f111aa28df81066cee5ac5fc7a227"), for: .normal)
		return button
	}()

	lazy var playListButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "682ec86edf09f7838d6ae1d8f803cf01"), for: .normal)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		HTMusicPlayer.share.addObserver(self, forKeyPath: NSStringFromSelector(#selector(getter: HTMusicPlayer.rate)), options: [.initial, .new], context: nil)
		playControlButton.whenTouch(inside: { (_, _) in
			HTMusicPlayer.share.rate = 1 - HTMusicPlayer.share.rate
		})

		addSubview(progressSlider)
		addSubview(playLoopButton)
		addSubview(lastSongButton)
		addSubview(playControlButton)
		addSubview(nextSongButton)
		addSubview(playListButton)
		progressSlider.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.bottom.equalTo(playControlButton.snp.top)
		}
		playControlButton.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-13)
			maker.centerX.equalTo(self)
		}
		playLoopButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.centerY.equalTo(playControlButton)
		}
		playListButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-6)
			maker.centerY.equalTo(playControlButton)
		}
		lastSongButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(UIScreen.main.bounds.size.width / 4.0 + 10)
			maker.centerY.equalTo(playControlButton)
		}
		nextSongButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(UIScreen.main.bounds.size.width / 4.0 * 3 - 10)
			maker.centerY.equalTo(playControlButton)
		}
	}

	deinit {
		HTMusicPlayer.share.removeObserver(self, forKeyPath: NSStringFromSelector(#selector(getter: HTMusicPlayer.rate)))
	}

	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		playControlButton.isSelected = HTMusicPlayer.share.rate > 0
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
