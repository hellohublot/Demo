//
//  HTExerciseHeaderView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseSectionHeaderView: UICollectionReusableView, ReuseCell {
    
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.init(name: "PingFangSC-Semibold", size: 18)
		button.setTitleColor(UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
		let image = UIImage.init(named: "c5521d86e56256301223f0fb714ee877")
		button.setImage(image, for: .normal)
		button.contentHorizontalAlignment = .left
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
		return button
	}()
	
	lazy var separatorView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)		
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleButton)
		addSubview(separatorView)
		titleButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15))
		}
		separatorView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseSectionModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
    }
    
}
