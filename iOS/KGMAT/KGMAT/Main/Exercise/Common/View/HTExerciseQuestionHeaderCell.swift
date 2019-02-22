//
//  HTExerciseQuestionNavigationCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseQuestionHeaderCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		button.setTitleColor(UIColor.init(red: 0.66, green: 0.66, blue: 0.66, alpha: 1), for: .normal)
		button.setTitleColor(UIColor.init(red: 0.32, green: 0.59, blue: 0.92, alpha: 1), for: .selected)
        button.isUserInteractionEnabled = false
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleButton)
		titleButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseQuestionPageModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
		titleButton.isSelected = model.selected ?? false
	}
    
}
