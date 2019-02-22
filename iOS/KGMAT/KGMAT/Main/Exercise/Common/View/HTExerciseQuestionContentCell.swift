//
//  HTExerciseQuestionContentCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseQuestionContentCell: UICollectionViewCell, ReuseCell {
	
	lazy var tableView: UITableView = {
		let tableView = UITableView.init(frame: CGRect.zero)
		tableView.backgroundColor = UIColor.clear
		tableView.isScrollEnabled = false
		tableView.separatorStyle = .none
        tableView.layer.masksToBounds = false
		return tableView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(tableView)
		tableView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseQuestionPageModel else {
			return
		}
		tableView.setCellModelArray(model.itemModelArray, proxy: self)
        tableView.reloadData()
	}
	
}

extension HTExerciseQuestionContentCell: TableViewThrough {
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTExerciseQuestionContentItemCell.self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reuseView(tableView, numberOfRowsInSection: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return reuseView(tableView, cellForRowAt: indexPath) as! UITableViewCell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
}
