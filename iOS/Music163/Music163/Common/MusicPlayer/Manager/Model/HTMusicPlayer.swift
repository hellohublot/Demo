//
//  HTMusicPlayer.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import AVFoundation

class HTMusicPlayer: NSObject {

	static let share = HTMusicPlayer.init()

	lazy var player: AVPlayer = {
		let player = AVPlayer.init()
		return player
	}()

	lazy var timer: Timer = {
		let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
		timer.fireDate = Date.distantFuture
		return timer
	}()

	var url: URL? {

		willSet {
			if url != nil, newValue?.absoluteString == url?.absoluteString {
				return
			}
			guard let playURL = newValue else {
				return
			}
			let asset = AVAsset.init(url: playURL)
			guard asset.isPlayable else {
				return
			}
			let item = AVPlayerItem.init(asset: asset)
			player.replaceCurrentItem(with: item)
			durationTime = CGFloat(item.duration.value) / CGFloat(item.duration.timescale)
			timer.fire()
		}

	}

	var durationTime: CGFloat = 0

	var currentTime: CGFloat = 0

	@objc dynamic var rate: Float {
		get {
			return player.rate
		}
		set {
			player.rate = newValue

			if newValue <= 0 {
				timer.fireDate = Date.distantFuture
			}
			UIApplication.shared.isIdleTimerDisabled = newValue > 0
		}
	}

	@objc func updateCurrentTime() {
		let cmtime = player.currentItem?.currentTime() ?? CMTime.init()
		currentTime = CGFloat(cmtime.value) / CGFloat(cmtime.timescale)
	}

	func seekTo(_ time: CGFloat, _ complete: ((_: Bool) -> Void)?) {
		let cmtime = CMTime.init(value: Int64(time), timescale: 1)
		player.seek(to: cmtime) { (finished) in
			complete?(finished)
		}
	}

}
