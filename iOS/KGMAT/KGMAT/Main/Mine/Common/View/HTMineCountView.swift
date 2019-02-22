//
//  HTMineCountView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineCountView: UIView, ReuseCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.setContentHuggingPriority(UILayoutPriority.init(900), for: .horizontal)
        imageView.setContentCompressionResistancePriority(UILayoutPriority.init(900), for: .horizontal)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: "PingFangSC-Light", size: 16)
        label.textColor = UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: "Bebas", size: 16)
        label.textColor = UIColor.init(red: 0.71, green: 0.71, blue: 0.71, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        imageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(20)
            maker.centerY.equalTo(self)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imageView).offset(10)
            maker.left.equalTo(imageView.snp.right).offset(8)
            maker.right.equalTo(-10)
        }
        detailLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleLabel.snp.bottom).offset(2)
            maker.left.right.equalTo(titleLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTMineCountModel else {
            return
        }
        imageView.image = UIImage.init(named: model.image ?? "")
        titleLabel.text = model.title
        detailLabel.text = model.text
    }
    
}
