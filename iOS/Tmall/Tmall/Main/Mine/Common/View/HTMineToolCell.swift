//
//  HTMineToolCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineToolCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleImageView)
		contentView.addSubview(titleLabel)
		titleImageView.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(-10)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(contentView)
			maker.top.equalTo(titleImageView.snp.bottom).offset(8)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineToolModel else {
			return
		}
		titleImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
	}
	
}
