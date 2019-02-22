//
//  HTMineRecordCell.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineRecordCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 17)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		label.setContentHuggingPriority(UILayoutPriority.init(99), for: .horizontal)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(99), for: .horizontal)
		return label
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
		let image = UIImage.init(named: "5c3f8097dca6accc038b9a42ea6a3dc2")
		button.setImage(image, for: .normal)
		button.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -8)
		return button
	}()
	
	lazy var separatorLine: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05)
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailButton)
		contentView.addSubview(separatorLine)
		titleImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(18)
			maker.centerY.equalTo(contentView)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleImageView.snp.right).offset(20)
			maker.centerY.equalTo(contentView)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel.snp.right).offset(10)
			maker.right.equalTo(-10)
			maker.centerY.equalTo(contentView)
		}
		separatorLine.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.right.bottom.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineRecordModel else {
			return
		}
		titleImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
		detailButton.setTitle(model.text, for: .normal)
		separatorLine.isHidden = !(model.showSeparatorLine ?? false)
	}
	
}
