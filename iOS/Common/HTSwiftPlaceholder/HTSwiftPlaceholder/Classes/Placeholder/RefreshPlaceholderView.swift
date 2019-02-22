//
//  HTPlaceholderFirstRefresh.swift
//  Live
//
//  Created by hublot on 2017/12/16.
//  Copyright © 2017年 hublot. All rights reserved.
//

import UIKit
import HTSwift

public class RefreshPlaceholderView: UIView, PlaceholderAble {
	
	lazy var activity: UIActivityIndicatorView = {
		let activity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
		activity.hidesWhenStopped = false
		activity.startAnimating()
		return activity
	}()
	
	override public func didMoveToSuperview() {
		guard let _ = superview else {
			return
		}
		addSubview(activity)
		translatesAutoresizingMaskIntoConstraints = false
		activity.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: activity, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: activity, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
		])
	}
	
	public func placeholderShow() {
		activity.isHidden = false
		DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(50)) {
			self.activity.startAnimating()
		}
	}
	
	public func placeholderHidden() {
		activity.isHidden = true
	}
	
}
