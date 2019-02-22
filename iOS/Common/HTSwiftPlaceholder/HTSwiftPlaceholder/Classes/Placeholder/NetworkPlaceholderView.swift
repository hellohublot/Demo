//
//  HTNetworkErrorPlaceholderView.swift
//  Live
//
//  Created by hublot on 2017/12/16.
//  Copyright © 2017年 hublot. All rights reserved.
//

import UIKit
import HTSwift

public protocol NetworkDelegate: class {
	func reloadNetwork()
	func configNetwork()
}

public class NetworkPlaceholderView: UIView, PlaceholderAble {
	
	weak var delegate: NetworkDelegate?
	
	lazy var reloadButton: PlaceholderButton = {
		let button = PlaceholderButton(title: "重新加载")
		button.addTarget(self, action: #selector(reloadResponder), for: .touchUpInside)
		return button
	}()
	
	lazy var label: UILabel = {
		let label = UILabel()
		label.textColor = .orange
		label.font = UIFont.systemFont(ofSize: 15)
		label.text = "网络访问失败, 请检查网络链接"
		return label
	}()
	
	@objc func reloadResponder() {
		delegate?.reloadNetwork()
	}
	
	override public func didMoveToSuperview() {
		guard let _ = superview else {
			return
		}
		addSubview(label)
		translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -30)
			])
		addSubview(reloadButton)
		reloadButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: reloadButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: reloadButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 30),
			NSLayoutConstraint(item: reloadButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: 0),
			NSLayoutConstraint(item: reloadButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
			])
	}
	
}
