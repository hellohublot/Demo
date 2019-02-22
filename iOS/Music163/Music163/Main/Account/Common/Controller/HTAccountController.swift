//
//  HTAccountController.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTAccountController: UIViewController {
	
	lazy var backgroundView: HTAccountBackgroundView = {
		let backgroundView = HTAccountBackgroundView.init(frame: CGRect.zero)
		return backgroundView
	}()

	lazy var tableView: UITableView = {
		let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
		let frame = CGRect.init(x: 0, y: 0, width: 0, height: 0.0001)
		tableView.tableFooterView = UIView.init(frame: frame)
		tableView.tableHeaderView = UIView.init(frame: frame)
		tableView.estimatedSectionFooterHeight = 0.0001
		tableView.estimatedSectionHeaderHeight = 0.0001
		tableView.separatorStyle = .none
		tableView.backgroundColor = UIColor.clear
		tableView.register(HTAccountSectionFooterView.self, forHeaderFooterViewReuseIdentifier: HTAccountSectionFooterView.identifier)
		return tableView
	}()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		let modelArray = HTAccountSectionModel.packModelArray()
		tableView.setSectionModelArray(modelArray, proxy: self)
	}
	
	func initInterface() {
		navigationItem.title = "帐号"
		view.addSubview(tableView)
		tableView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		tableView.insertSubview(backgroundView, at: 0)
		backgroundView.snp.makeConstraints { (maker) in
			maker.top.equalTo(0)
			maker.left.equalTo(tableView)
			maker.width.equalTo(tableView)
			maker.height.equalTo(tableView)
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
}

extension HTAccountController: TableViewThrough {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		tableView.sendSubview(toBack: backgroundView)
		backgroundView.reloadFooterColorViewWithOffset(scrollView.contentSize.height)
	}
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		let sectionModel = tableView.sectionModelArray()[indexPath.section] as? HTAccountSectionModel
		switch sectionModel?.type {
		case .user?:
			return HTAccountUserCell.self
		case .message?, .more?, .setup?, .about?, .exit?:
			return HTAccountActionCell.self
		default:
			return HTAccountUserCell.self
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return reuseViewNumberOfSections(in: tableView)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reuseView(tableView, numberOfRowsInSection: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return reuseView(tableView, cellForRowAt: indexPath) as! UITableViewCell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let sectionModel = tableView.sectionModelArray()[indexPath.section] as? HTAccountSectionModel
		switch sectionModel?.type {
		case .user?:
			return 144
		case .message?, .more?, .setup?, .about?, .exit?:
			return 45
		default:
			return 45
		}
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 0.0001
	}
	
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HTAccountSectionFooterView.identifier)
		return view
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 10
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
} 
