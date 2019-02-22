//
//  HTMineSectionHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineSectionHeaderView: UICollectionReusableView, ReuseCell {

	lazy var lineView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(white: 0, alpha: 0.05)
		return view
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.textColor = UIColor.init(red: 0.02, green: 0.11, blue: 0.16, alpha: 1)
		return label
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), for: .normal)
		let image = UIImage.init(named: "3a2ee339f70366f8539a83f84501d28f")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -5)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(lineView)
		addSubview(titleLabel)
		addSubview(detailButton)
		lineView.snp.makeConstraints { (maker) in
            maker.left.equalTo(15)
			maker.top.right.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.centerY.equalTo(self)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-15)
			maker.centerY.equalTo(self)
		}
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineSectionModel else {
			return
		}
		lineView.isHidden = indexPath.section == 0
		titleLabel.text = model.title
		detailButton.setTitle(model.text, for: .normal)
		detailButton.isHidden = (model.text?.count ?? 0) <= 0
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
