//
//  HTCourseSectionHeaderView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseSectionHeaderView: UITableViewHeaderFooterView, ReuseCell {

	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.init(name: ".SFUIDisplay-Medium", size: 20)
		button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
		let image = UIImage.init(named: "ac68892c3448c1758d96cfd2fd5fba9e")
		button.setImage(image, for: .normal)
		button.contentHorizontalAlignment = .left
		button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
        button.isUserInteractionEnabled = false
		return button
	}()
	
	lazy var separatorView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)		
		return view
	}()
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		contentView.addSubview(titleButton)
		contentView.addSubview(separatorView)
		titleButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0))
		}
		separatorView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCourseSectionModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
		separatorView.isHidden = indexPath.section == 1
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
