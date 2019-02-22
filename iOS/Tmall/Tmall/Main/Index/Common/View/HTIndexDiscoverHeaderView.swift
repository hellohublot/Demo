//
//  HTIndexDiscoverHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexDiscoverHeaderView: UICollectionReusableView, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
		button.setTitleColor(UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
		button.contentHorizontalAlignment = .left
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleButton)
		titleButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(10)
			maker.right.equalTo(-10)
			maker.centerY.equalTo(self)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexSectionModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
	}
    
}
