//
//  Placeholder.swift
//  Live
//
//  Created by hublot on 2017/12/18.
//  Copyright © 2017年 hublot. All rights reserved.
//

import UIKit
import HTSwift

open class Placeholder: PlaceholderProvider, NetworkDelegate, AuthDelegate {
	
	open weak var superView: UIView?
	
	public typealias ReloadNetworkHandler = (() -> Void)
	
	open var reloadNetworkHandler: ReloadNetworkHandler?
	
	open func reloadNetwork() {
		if let reloadNetworkHandler = reloadNetworkHandler {
			reloadNetworkHandler()
		} else if let scrollView = superView as? UIScrollView {
			scrollView.respondHeaderRefresh()
		}
	}
	
	open func configNetwork() {
		
	}
	
	open func authLogin() {
		
	}
	
	open func authRegister() {
		
	}
	
	open static var `default`: Placeholder {
		let provider = Placeholder()
		provider.setPlaceholderView(RefreshPlaceholderView(), forState: .firstRefresh)
		provider.setPlaceholderView(NothingPlaceholderView(), forState: .nothingDisplay)
		let networkView = NetworkPlaceholderView()
		networkView.delegate = provider
		provider.setPlaceholderView(networkView, forState: .errorNetwork)
		let authView = AuthPlaceholderView()
		authView.delegate = provider
		provider.setPlaceholderView(authView, forState: .needAuth)
		return provider
	}
	
	open var placeholderList = [PlaceholderState: (UIView & PlaceholderAble)]()
	
	open func setPlaceholderView(_ placeholderView: (UIView & PlaceholderAble), forState state: PlaceholderState) {
		placeholderList[state] = placeholderView
	}
	
	open func placeholderViewFromState(_ state: PlaceholderState) -> (UIView & PlaceholderAble)? {
		let placeholderView = placeholderList[state]
		return placeholderView
	}

}
