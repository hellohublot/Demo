//
//  HTAccountBackgroundView.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTAccountBackgroundView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.08)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadFooterColorViewWithOffset(_ offset: CGFloat) {
		snp.updateConstraints { (maker) in
			maker.top.equalTo(offset)
		}
	}

}
