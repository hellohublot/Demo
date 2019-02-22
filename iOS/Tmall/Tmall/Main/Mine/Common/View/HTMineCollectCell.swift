//
//  HTMineStoreCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineCollectCell: UICollectionViewCell, ReuseCell {
    
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
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
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailLabel)
		titleLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(10)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(titleLabel.snp.bottom).offset(10)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineCollectModel else {
			return
		}
		titleLabel.text = model.title
		detailLabel.text = model.text
	}
	
}
