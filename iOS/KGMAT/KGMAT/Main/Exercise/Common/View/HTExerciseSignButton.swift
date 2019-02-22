//
//  HTExerciseSignButton.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTExerciseSignButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		titleLabel?.font = UIFont.systemFont(ofSize: 12)
		setTitleColor(UIColor.white, for: .normal)
		setTitle("打卡签到", for: .normal)
		let image = UIImage.init(named: "acbee6a7c9977ec0b0ef709f1a0454ed")
		var backgroundImage = UIImage.init(named: "7cceca9a02b9299aec70fc19df25e09e")
		backgroundImage = backgroundImage?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 40, bottom: 0, right: 0), resizingMode: .stretch)
		setImage(image, for: .normal)
		setBackgroundImage(backgroundImage, for: .normal)
		contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 20, bottom: 15, right: 15)
		ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
