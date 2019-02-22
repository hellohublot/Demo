//
//  HTMineRecommendHeaderView.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineRecommendHeaderView: UICollectionReusableView, ReuseCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .center
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMineSectionModel else {
			return
		}
		titleLabel.text = model.title
	}
        
}
