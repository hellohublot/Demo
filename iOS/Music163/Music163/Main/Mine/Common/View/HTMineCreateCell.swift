//
//  HTMineCreateCell.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineCreateCell: UICollectionViewCell, ReuseCell {
	
	lazy var headImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 17)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.16)
		return label
	}()
	
	lazy var darkView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        view.isUserInteractionEnabled = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(headImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailLabel)
		contentView.addSubview(darkView)
		headImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(6)
			maker.top.equalTo(6)
			maker.bottom.equalTo(6)
			maker.height.equalTo(headImageView.snp.width)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(headImageView.snp.right).offset(8)
			maker.top.equalTo(headImageView).offset(8)
			maker.right.equalTo(-10)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.bottom.equalTo(headImageView).offset(-8)
			maker.right.equalTo(-10)
		}
		darkView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(headImageView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineCreateModel else {
			return
		}
		headImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
		detailLabel.text = model.text
	}
    
}
