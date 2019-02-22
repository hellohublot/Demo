//
//  HTIndexImageFooterView.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexImageFooterView: UICollectionReusableView, ReuseCell {
	
	lazy var imageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFill
		let image = UIImage.init(named: "1efeccc64ca3493be48675203f55972a")
		imageView.image = image
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(imageView)
		imageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		
	}
        
}
