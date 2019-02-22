//
//  HTIndexCheapHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexCheapHeaderView: UICollectionReusableView, ReuseCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = UIColor.init(red: 0.11, green: 0.11, blue: 0.11, alpha: 1)
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleLabel)
		addSubview(detailLabel)
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(20)
			maker.top.equalTo(15)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel.snp.right).offset(10)
			maker.centerY.equalTo(titleLabel)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexSectionModel else {
			return
		}
		titleLabel.text = model.title
		detailLabel.text = model.detail
	}
	
}
