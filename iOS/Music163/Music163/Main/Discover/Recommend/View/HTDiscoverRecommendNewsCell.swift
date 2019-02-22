//
//  HTDiscoverRecommendNewsCell.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendNewsCell: UICollectionViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.layer.masksToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 3
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 13)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
        label.lineBreakMode = .byTruncatingTail
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.16)
        label.lineBreakMode = .byTruncatingTail
		return label
	}()
	
	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
        view.isUserInteractionEnabled = false
		return view
	}()
	
	lazy var wordImagView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
        imageView.alpha = 0.7
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailLabel)
        contentView.addSubview(darkView)
        contentView.addSubview(wordImagView)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.bottom.equalTo(titleLabel.snp.top).offset(-8)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(3)
			maker.right.equalTo(-3)
			maker.bottom.equalTo(detailLabel.snp.top)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(titleLabel)
			maker.bottom.equalTo(-8)
            maker.height.equalTo(titleLabel)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
		wordImagView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTDiscoverRecommendNewsModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
		detailLabel.text = model.text
		wordImagView.image = UIImage.init(named: model.selectedImage ?? "")
        if wordImagView.image == nil {
            darkView.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        } else {
            darkView.backgroundColor = UIColor.init(white: 0, alpha: 0.4)
        }
	}
    
}
