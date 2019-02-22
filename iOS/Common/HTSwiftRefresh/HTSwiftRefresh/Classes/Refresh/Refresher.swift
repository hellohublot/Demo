//
//  Refresh.swift
//  Live
//
//  Created by hublot on 2017/12/18.
//  Copyright © 2017年 hublot. All rights reserved.
//

import Foundation
import MJRefresh
import HTSwift

extension MJRefreshHeader: RefreshControl {

	public var block: ControlHandler? {
		get {
			return self.refreshingBlock
		}
		set {
			self.refreshingBlock = newValue
		}
	}
	
	public var refresh: Bool? {
		return self.isRefreshing
	}
	
	public func endRefresh() {
		self.endRefreshing()
	}
	
}

extension MJRefreshFooter: RefreshFooterControl {
	
	public var block: ControlHandler? {
		get {
			return self.refreshingBlock
		}
		set {
			self.refreshingBlock = newValue
		}
	}
	
	public var refresh: Bool? {
		return self.isRefreshing
	}
	
	public func endRefresh() {
		self.isHidden = false
		self.endRefreshing()
	}
	
	public func endRefreshWithNoMoreData() {
		self.isHidden = true
		self.endRefreshingWithNoMoreData()
	}
	
}

open class Refresher: NSObject, RefreshProvider {
	
	open static var `default`: Refresher {
		let provider = Refresher()
		provider.headerControl = {
			let header = MJRefreshNormalHeader()
//			header.stateLabel.isHidden = true
//			header.setTitle("", for: .idle)
//			header.lastUpdatedTimeLabel.isHidden = true
			return header
		}()
		provider.footerControl = {
			let footer = MJRefreshBackNormalFooter()
			footer.stateLabel.isHidden = true
//			footer.isAutomaticallyHidden = true
			return footer
		}()
		return provider
	}
	
	open weak var superView: UIScrollView? {
		get {
			return nil
		}
		set {
			if let header = headerControl as? MJRefreshHeader {
				newValue?.mj_header = header
			}
			if let footer = footerControl as? MJRefreshFooter {
				newValue?.mj_footer = footer
			}
		}
	}
	
	open var headerControl: RefreshControl?
	
	open var footerControl: RefreshFooterControl?
	
}
