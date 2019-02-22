//
//  HTMineCardHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMinePacketFooterView: UICollectionReusableView, ReuseCell {
	
	lazy var packetButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
		button.setTitle("红包", for: .normal)
		return button
	}()
	
	lazy var buyCardButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
		button.setTitle("购物劵", for: .normal)
		return button

	}()
	
	lazy var storeCardButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
		button.setTitle("店铺劵", for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(packetButton)
		addSubview(buyCardButton)
		addSubview(storeCardButton)
		packetButton.snp.makeConstraints { (maker) in
			maker.left.top.bottom.equalTo(0)
		}
		buyCardButton.snp.makeConstraints { (maker) in
			maker.top.bottom.equalTo(0)
			maker.left.equalTo(packetButton.snp.right)
			maker.width.equalTo(packetButton)
		}
		storeCardButton.snp.makeConstraints { (maker) in
			maker.top.bottom.equalTo(0)
			maker.left.equalTo(buyCardButton.snp.right)
			maker.width.equalTo(packetButton)
			maker.right.equalTo(0)
		}
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineSectionModel else {
			return
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
