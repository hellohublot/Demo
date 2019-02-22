//
//  HTIndexCheapCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexCheapCell: UICollectionViewCell, ReuseCell {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.cornerRadius = 2
		button.layer.borderWidth = 1
		button.layer.masksToBounds = true
		button.setTitleColor(UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1), for: .normal)
		button.layer.borderColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1).cgColor
		button.backgroundColor = UIColor.init(red: 1, green: 0.93, blue: 0.95, alpha: 1)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(backgroundImageView)
		contentView.addSubview(titleButton)
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10))
		}
		titleButton.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-10)
			maker.centerX.equalTo(contentView)
            maker.height.equalTo(15)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTIndexCheapModel else {
			return
		}
		let image = UIImage.init(named: model.image ?? "")
		backgroundImageView.image = image
		titleButton.setTitle(model.title, for: .normal)
	}
    
}
