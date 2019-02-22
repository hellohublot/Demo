//
//  PlachholderButton.swift
//  Alamofire
//
//  Created by hublot on 2017/12/23.
//

import Foundation
import HTSwift

class PlaceholderButton: UIButton {
	
	var mainColor: UIColor = .orange
	
	init(title: String) {
		super.init(frame: CGRect.zero)
		setTitle(title, for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 14)
		setTitleColor(mainColor, for: .normal)
		setTitleColor(.white, for: .highlighted)
		setBackgroundImage(UIImage.from(UIColor.white), for: .normal)
		setBackgroundImage(UIImage.from(mainColor), for: .highlighted)
		layer.cornerRadius = 3
		layer.masksToBounds = true
		layer.borderColor = mainColor.cgColor
		layer.borderWidth = 1
		setContentHuggingPriority(UILayoutPriority(Float(50)), for: .horizontal)
		setContentHuggingPriority(UILayoutPriority(Float(50)), for: .vertical)
		setContentCompressionResistancePriority(UILayoutPriority(Float(50)), for: .horizontal)
		setContentCompressionResistancePriority(UILayoutPriority(Float(50)), for: .vertical)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
