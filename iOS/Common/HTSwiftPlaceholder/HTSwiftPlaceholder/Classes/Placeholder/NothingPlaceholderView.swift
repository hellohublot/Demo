//
//  HTNothingDisplayView.swift
//  Live
//
//  Created by hublot on 2017/12/16.
//  Copyright © 2017年 hublot. All rights reserved.
//

import UIKit
import HTSwift

public class NothingPlaceholderView: UIView, PlaceholderAble {
	
	lazy var label: UILabel = {
		let label = UILabel()
		label.textColor = .orange
		label.font = UIFont.systemFont(ofSize: 15)
		label.text = "这儿什么也没有喔"
		return label
	}()
	
	override public func didMoveToSuperview() {
		guard let _ = superview else {
			return
		}
		addSubview(label)
		translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
		])
	}
	
}
