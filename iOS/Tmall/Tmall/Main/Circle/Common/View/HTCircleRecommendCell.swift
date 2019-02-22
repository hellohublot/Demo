//
//  HTCircleRecommendCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCircleRecommendCell: UICollectionViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		return imageView
	}()
	
	lazy var flagButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.white, for: .normal)
		let image = UIImage.init(named: "1774adbd6130339e43bdcea3c43ac24b")?.imageWith(zoom: 0.5)
		button.setBackgroundImage(image, for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
		button.contentHorizontalAlignment = .left
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = UIColor.black
		return label
	}()
	
	lazy var dateButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "6be142a27bfc6efc14fcd20cb71c8e8a")?.imageWith(zoom: 0.5)
		button.setImage(image, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.57, green: 0.57, blue: 0.57, alpha: 1), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.layer.cornerRadius = 5
		contentView.layer.masksToBounds = true
        
        layer.cornerRadius = contentView.layer.cornerRadius
        backgroundColor = UIColor.white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.init(width: 0, height: 2)
        layer.shadowOpacity = 0.13
		
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(flagButton)
		contentView.addSubview(titleLabel)
		contentView.addSubview(dateButton)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
		}
		flagButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(backgroundImageView).offset(-10)
			maker.width.equalTo(backgroundImageView).multipliedBy(0.85)
			maker.bottom.equalTo(backgroundImageView)
			maker.height.equalTo(18)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.top.equalTo(backgroundImageView.snp.bottom).offset(10)
			maker.left.equalTo(backgroundImageView).offset(5)
			maker.right.equalTo(backgroundImageView)
		}
		dateButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.top.equalTo(titleLabel.snp.bottom).offset(10)
			maker.bottom.equalTo(-10)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCircleRecommendModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
		flagButton.setTitle(model.flagTitle, for: .normal)
		titleLabel.text = model.title
		dateButton.setTitle(model.dateTitle, for: .normal)
	}
    
}
