//
//  HTCourseOpenHeaderView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseOpenHeaderView: UITableViewHeaderFooterView, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.init(name: ".SFUIText-Medium", size: 16)
		button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
        button.isUserInteractionEnabled = false
		return button
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.setTitleColor(UIColor.init(red: 0.52, green: 0.52, blue: 0.52, alpha: 1), for: .normal)
		let image = UIImage.init(named: "fb6dddd69f88f4aa3616f45878a3a271")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -5)
        button.isUserInteractionEnabled = false
		return button
	}()
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		contentView.addSubview(titleButton)
		contentView.addSubview(detailButton)
		titleButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.centerY.equalTo(contentView)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-15)
			maker.centerY.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCourseSectionModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
		titleButton.setImage(UIImage.init(named: model.image ?? ""), for: .normal)
		detailButton.setTitle(model.detail, for: .normal)
	}

}
