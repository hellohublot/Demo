//
//  HTExerciseGuideCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseGuideCell: UICollectionViewCell, ReuseCell {
	
	lazy var headImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		imageView.setContentHuggingPriority(UILayoutPriority.init(900), for: .horizontal)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(900), for: .horizontal)
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.init(name: "PingFangSC-Medium", size: 18)
		label.textColor = UIColor.init(red: 0.17, green: 0.17, blue: 0.17, alpha: 1)
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.init(name: "PingFangSC-Regular", size: 14)
		label.textColor = UIColor.init(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.backgroundColor = UIColor.white
		contentView.layer.cornerRadius = 5
		contentView.layer.shadowColor = UIColor.black.cgColor
		contentView.layer.shadowOffset = CGSize.zero
		contentView.layer.shadowRadius = 4
		contentView.layer.shadowOpacity = 0.15
		
		contentView.addSubview(headImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailLabel)
		headImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.centerY.equalTo(contentView)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(headImageView.snp.right).offset(15)
			maker.right.equalTo(-15)
			maker.top.equalTo(headImageView).offset(3)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(titleLabel)
			maker.bottom.equalTo(headImageView).offset(-3)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseGuideModel else {
			return
		}
		headImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
		detailLabel.text = model.text
	}
    
}
