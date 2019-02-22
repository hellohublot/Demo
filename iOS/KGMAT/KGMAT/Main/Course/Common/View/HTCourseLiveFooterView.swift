//
//  HTCourseLiveFooterView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseLiveFooterView: UITableViewHeaderFooterView, ReuseCell {
    
    lazy var timeLineView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        return view
    }()
    
    lazy var timeImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        let image = UIImage.init(named: "3a14d427a3aadb6e384160781564dc73")
        imageView.image = image
        return imageView
    }()
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.init(name: ".SFUIText-Medium", size: 16)
        button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
        let image = UIImage.init(named: "fb6dddd69f88f4aa3616f45878a3a271")
        button.setImage(image, for: .normal)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -8)
        button.setTitle("查看更多", for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(timeLineView)
        contentView.addSubview(timeImageView)
        contentView.addSubview(titleButton)
        timeLineView.snp.makeConstraints { (maker) in
            maker.top.equalTo(0)
            maker.bottom.equalTo(timeImageView.snp.top)
            maker.width.equalTo(1 / UIScreen.main.scale)
            maker.centerX.equalTo(timeImageView)
        }
        timeImageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(16)
            maker.centerY.equalTo(contentView)
        }
        titleButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeImageView.snp.right).offset(15)
            maker.centerY.equalTo(timeImageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		
	}

}
