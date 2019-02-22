//
//  HTCourseGradeCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTCourseGradeStyle {
    case full
    case left
    case right
}

class HTCourseGradeCell: UIView, ReuseCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.init(white: 1, alpha: 0.7)
        return label
    }()
    
    init(frame: CGRect, _ style: HTCourseGradeStyle) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(textLabel)
        
        backgroundColor = UIColor.white
        layer.shadowOffset = CGSize.init(width: 0, height: 2)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.init(red: 0.635294, green: 0.635294, blue: 0.635294, alpha: 1).cgColor
        
        imageView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        var alignment = NSTextAlignment.left
        var detailFont: UIFont?
        switch style {
        case .full:
            alignment = .left
            detailFont = UIFont.init(name: ".SFUIDisplay-Medium", size: 23)
            titleLabel.snp.makeConstraints { (maker) in
                maker.top.equalTo(20)
                maker.left.equalTo(24)
            }
            detailLabel.snp.makeConstraints { (maker) in
                maker.left.equalTo(titleLabel)
                maker.top.equalTo(titleLabel.snp.bottom).offset(3)
            }
            textLabel.snp.makeConstraints { (maker) in
                maker.left.equalTo(titleLabel)
                maker.top.equalTo(detailLabel.snp.bottom).offset(15)
            }
        case .left, .right:
            alignment = .left
            if case .left = style {
                detailFont = UIFont.init(name: ".SFUIDisplay-Medium", size: 20)
            } else {
                detailFont = UIFont.init(name: ".SFUIDisplay-Light", size: 20)
            }
            titleLabel.snp.makeConstraints { (maker) in
                maker.top.equalTo(20)
                maker.right.equalTo(-15)
            }
            detailLabel.snp.makeConstraints { (maker) in
                maker.right.equalTo(titleLabel)
                maker.top.equalTo(titleLabel.snp.bottom).offset(3)
            }
            textLabel.snp.makeConstraints { (maker) in
                maker.right.equalTo(titleLabel)
                maker.top.equalTo(detailLabel.snp.bottom).offset(15)
            }
        }
        titleLabel.textAlignment = alignment
        detailLabel.textAlignment = alignment
        textLabel.textAlignment = alignment
        detailLabel.font = detailFont
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCourseGradeModel else {
            return
        }
        imageView.image = UIImage.init(named: model.image ?? "")
        titleLabel.text = model.title
        detailLabel.text = model.detail
        textLabel.text = model.text
    }

}
