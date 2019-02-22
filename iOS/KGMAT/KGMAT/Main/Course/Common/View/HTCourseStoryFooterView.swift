//
//  HTCourseStoryFooterView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseStoryFooterView: UITableViewHeaderFooterView, ReuseCell {
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.init(name: ".SFUIText-Medium", size: 16)
        button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
        let image = UIImage.init(named: "fb6dddd69f88f4aa3616f45878a3a271")
        button.setImage(image, for: .normal)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -8)
        button.setTitle("查看更多", for: .normal)
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleButton)
        titleButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(15)
            maker.centerY.equalTo(contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		
	}

}
