//
//  HTMineCreateFooterView.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineCreateFooterView: UICollectionReusableView, ReuseCell {
	
	lazy var separatorView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.08)
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(separatorView)
		separatorView.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.height.equalTo(5)
			maker.bottom.equalTo(-8)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		
	}
	
}
