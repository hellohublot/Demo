//
//  HTCircleDiscoverHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCircleRecommendHeaderView: UICollectionReusableView, ReuseCell {
	
	lazy var lineView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.05)
		return view
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.textColor = UIColor.black
		label.font = UIFont.boldSystemFont(ofSize: 18)
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(lineView)
		addSubview(titleLabel)
		addSubview(detailLabel)
		lineView.snp.makeConstraints { (maker) in
			maker.left.equalTo(12)
			maker.top.equalTo(12)
			maker.right.equalTo(-10)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(12)
			maker.top.equalTo(30)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(titleLabel)
			maker.left.equalTo(titleLabel.snp.right).offset(10)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCircleSectionModel else {
			return
		}
		titleLabel.text = model.title
		detailLabel.text = model.detail
	}
        
}
