//
//  HTGrassHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTGrassDiscoverHeaderView: UICollectionReusableView, ReuseCell {

	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.textColor = UIColor.init(red: 0.02, green: 0.11, blue: 0.16, alpha: 1)
		label.font = UIFont.boldSystemFont(ofSize: 18)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.centerY.equalTo(self)
		}
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTGrassSectionModel else {
			return
		}
		titleLabel.text = model.title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
