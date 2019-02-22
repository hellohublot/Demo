//
//  HTNeedAuthPlaceholderView.swift
//  Live
//
//  Created by hublot on 2017/12/16.
//  Copyright © 2017年 hublot. All rights reserved.
//

import UIKit
import HTSwift

public protocol AuthDelegate: class {
	func authLogin()
	func authRegister()
}

public class AuthPlaceholderView: UIView, PlaceholderAble {
	
	weak var delegate: AuthDelegate?
	
	lazy var loginButton: PlaceholderButton = {
		let button = PlaceholderButton(title: "登录 / 注册")
		button.addTarget(self, action: #selector(loginResponder), for: .touchUpInside)
		return button
	}()
	
	lazy var label: UILabel = {
		let label = UILabel()
		label.textColor = .orange
		label.font = UIFont.systemFont(ofSize: 15)
		label.text = "需要登录, 请登录后查看"
		return label
	}()
	
	@objc func loginResponder() {
		delegate?.authLogin()
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
		addSubview(loginButton)
		loginButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: loginButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 30),
			NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: 0),
			NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
			])
	}
}
