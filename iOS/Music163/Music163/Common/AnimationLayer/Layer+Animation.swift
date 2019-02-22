//
//  Layer+Animation.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

extension CALayer {

	func resumeAnimation(_ resume: Bool) {
		if resume {
			let pauseTime = timeOffset
			speed = 1.0
			timeOffset = 0.0
			beginTime = 0.0
			let startTime = convertTime(CACurrentMediaTime(), from: nil) - pauseTime
			beginTime = startTime
		} else {
			let pauseTime = convertTime(CACurrentMediaTime(), from: nil)
			speed = 0.0
			timeOffset = pauseTime
		}
	}

}
