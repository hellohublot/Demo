//
//  HTDiscoverRecommendSectionHeaderView.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendSectionHeaderView: UICollectionReusableView, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.init(name: "PingFangSC-Medium", size: 17)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45), for: .normal)
		let image = UIImage.init(named: "e277daf74eef9e27a80954a7b42bcad5")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -8)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(titleButton)
		titleButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(6)
            maker.bottom.equalTo(-11)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTDiscoverRecommendSectionModel else {
			return
		}
		titleButton.setTitle(model.title, for: .normal)
	}
	
}
