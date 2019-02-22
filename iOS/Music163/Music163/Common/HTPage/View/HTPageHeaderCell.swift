//
//  HTDiscoverNavigationCell.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTPageHeaderCell: UICollectionViewCell, ReuseCell {
	
	static let titleFont = UIFont.init(name: "PingFangSC-Medium", size: 15) ?? UIFont.init()
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = type(of: self).titleFont
		button.setTitleColor(UIColor.init(red: 0.47, green: 0.47, blue: 0.47, alpha: 1), for: .normal)
		button.setTitleColor(UIColor.init(red: 0.713725, green: 0.180392, blue: 0.172549, alpha: 1), for: .selected)
		button.isUserInteractionEnabled = false
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleButton)
		titleButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 0, bottom: 4, right: 0))
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTPageModelAble else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
		titleButton.isSelected = model.selected ?? false
	}
	
}
