//
//  HTExerciseHardCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseHardCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.init(name: "PingFangSC-Semibold", size: 16)
		button.setTitleColor(UIColor.white, for: .normal)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleButton)
		titleButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseHardModel	else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
		titleButton.setBackgroundImage(UIImage.init(named: model.image ?? ""), for: .normal)
	}
	
}
