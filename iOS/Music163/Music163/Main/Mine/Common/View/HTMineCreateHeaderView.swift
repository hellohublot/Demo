//
//  HTMineCreateHeaderView.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineCreateHeaderView: UICollectionReusableView, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25), for: .normal)
		let image = UIImage.init(named: "91a3b11c633db9411704e444996e6fd3")
		button.setImage(image, for: .normal)
		button.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
		button.contentHorizontalAlignment = .left
		return button
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "62b5faca40239b4674b656655e3d8160")
		button.setImage(image, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleButton)
		addSubview(detailButton)
		backgroundColor = UIColor.init(red: 0.35, green: 0.35, blue: 0.35, alpha: 0.05)
		titleButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(8)
			maker.centerY.equalTo(self)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleButton.snp.right).offset(10)
			maker.right.equalTo(-10)
			maker.centerY.equalTo(self)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineSectionModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
	}
	
}
