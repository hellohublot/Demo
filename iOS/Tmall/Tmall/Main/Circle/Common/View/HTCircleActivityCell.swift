//
//  HTCircleActivityCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCircleActivityCell: UICollectionViewCell, ReuseCell {
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(imageView)
		imageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCircleActivityModel else {
			return
		}
		imageView.image = UIImage.init(named: model.image ?? "")
	}
	
}
