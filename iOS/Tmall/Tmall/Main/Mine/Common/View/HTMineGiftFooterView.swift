//
//  HTMineGiftFooterView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineGiftFooterView: UICollectionReusableView, ReuseCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.textColor = UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
		label.font = UIFont.systemFont(ofSize: 12)
		label.text = "每单精选商品超过88元，即可累积1笔有效订单~"
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0))
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineSectionModel else {
			return
		}
	}
	
}
