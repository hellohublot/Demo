//
//  HTCourseNavigationBar.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTCourseNavigationBar: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: ".SFUIText-Semibold", size: 17)
        label.textColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.text = "考满分课程"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize.init(width: 0, height: 2)
		layer.shadowOpacity = 0.1
        alpha = 0
        titleLabel.alpha = 0
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.center.equalTo(contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadNavigationBarAlphaWithOffset(_ offset: CGFloat) {
        alpha = offset / HTCourseBackgroundView.imageBlueHeight
        titleLabel.alpha = alpha
    }
    
}
