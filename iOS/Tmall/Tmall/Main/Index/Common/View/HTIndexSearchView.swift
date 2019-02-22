//
//  HTIndexSearchView.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTIndexSearchView: UIView {

	lazy var searchButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "ef4958ea91a7f9462e180cc8635368cd")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.text = "手机"
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = UIColor.init(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
		label.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		return label
	}()
	
	lazy var cameraButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "04ce52c3cc3cccc0572fb9bfff465f72")
		button.setImage(image, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.white
		addSubview(searchButton)
		addSubview(titleLabel)
		addSubview(cameraButton)
		searchButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(5)
			maker.centerY.equalTo(self)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(searchButton.snp.right).offset(10)
			maker.right.equalTo(cameraButton.snp.left).offset(-10)
			maker.top.bottom.equalTo(0)
		}
		cameraButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-5)
			maker.centerY.equalTo(self)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
