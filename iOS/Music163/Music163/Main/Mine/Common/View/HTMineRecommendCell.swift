//
//  HTMineRecommendCell.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineRecommendCell: UICollectionViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.layer.masksToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 3
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var visitDarkImageView: UIImageView = {
		let darkImageView = UIImageView.init(frame: CGRect.zero)
		darkImageView.contentMode = .scaleAspectFill
		darkImageView.layer.masksToBounds = true
		let image = UIImage.init(named: "aeae746e72711700fb73f62d574ca9cd")
		darkImageView.image = image
		return darkImageView
	}()
	
	lazy var visitCountButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
		button.setImage(UIImage.init(named: "35c0f916db3a842347193dcb44f89278"), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
		return button
	}()
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .top
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.titleLabel?.numberOfLines = 2
        return button
    }()
	
	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        view.isUserInteractionEnabled = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(visitDarkImageView)
		contentView.addSubview(visitCountButton)
		contentView.addSubview(titleButton)
		contentView.addSubview(darkView)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.bottom.equalTo(titleButton.snp.top).offset(-3)
		}
		visitDarkImageView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(28)
		}
		visitCountButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(backgroundImageView).offset(-4)
			maker.top.equalTo(backgroundImageView).offset(3)
		}
		titleButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(3)
			maker.right.equalTo(-3)
			maker.height.equalTo(32)
			maker.bottom.equalTo(-8)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(backgroundImageView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineRecommendModel else {
			return
		}
		backgroundImageView.image = UIImage.init(named: model.image ?? "")
        titleButton.setTitle(model.title, for: .normal)
		visitCountButton.setTitle(model.text, for: .normal)
	}
    
}
