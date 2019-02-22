//
//  HTGrassCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTGrassDiscoverCell: UICollectionViewCell, ReuseCell {
    
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
		imageView.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.boldSystemFont(ofSize: 12)
		label.textColor = UIColor.black
		label.numberOfLines = 2
		return label
	}()
	
	lazy var userButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
		button.setTitleColor(UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1), for: .normal)
		button.imageView?.layer.cornerRadius = 10
		button.imageView?.layer.masksToBounds = true
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
	
	lazy var levelImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	lazy var likeButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
		button.setTitleColor(UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1), for: .normal)
		let image = UIImage.init(named: "d7a80028423790d99d2bd2fe9c30ce03")?.imageWith(zoom: 0.6).imageTintColor(UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1))
		button.setImage(image, for: .normal)
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
		contentView.addSubview(titleLabel)
		contentView.addSubview(userButton)
		contentView.addSubview(levelImageView)
		contentView.addSubview(likeButton)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.top.right.equalTo(0)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.top.equalTo(backgroundImageView.snp.bottom).offset(10)
			maker.left.equalTo(5)
			maker.right.equalTo(-5)
		}
		userButton.snp.makeConstraints { (maker) in
			maker.top.equalTo(titleLabel.snp.bottom).offset(10)
			maker.left.equalTo(titleLabel)
			maker.bottom.equalTo(-10)
		}
		levelImageView.snp.makeConstraints { (maker) in
			if let imageView = userButton.imageView {
				maker.right.bottom.equalTo(imageView)			
			}
		}
		likeButton.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(userButton)
			maker.right.equalTo(titleLabel)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTGrassDiscoverModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
		userButton.setImage(UIImage.init(named: model.userImage ?? "")?.imageWith(zoom: 0.5), for: .normal)
		userButton.setTitle(model.userTitle, for: .normal)
		levelImageView.image = UIImage.init(named: model.levelImage ?? "")?.imageWith(zoom: 0.5)
		likeButton.setTitle(model.likeTitle, for: .normal)
	}
	
}
