//
//  HTCourseServiceCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseServiceCell: UITableViewCell, ReuseCell {
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: ".SFUIText-Medium", size: 16)
        label.textColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        contentView.addSubview(headImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        headImageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(15)
            maker.centerY.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(headImageView)
            maker.left.equalTo(headImageView.snp.right).offset(15)
        }
        detailLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(titleLabel)
            maker.bottom.equalTo(headImageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCourseServiceModel else {
            return
        }
        headImageView.image = UIImage.init(named: model.image ?? "")
        titleLabel.text = model.title
        detailLabel.text = model.text
    }

}
