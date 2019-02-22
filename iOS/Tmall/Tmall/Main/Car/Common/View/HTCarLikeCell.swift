//
//  HTCarLikeCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCarLikeCell: UICollectionViewCell, ReuseCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
        return imageView
    }()
    
    lazy var brandButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10.5)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 3, bottom: 2, right: 3)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
        button.backgroundColor = UIColor.init(red: 134 / 255.0, green: 164 / 255.0, blue: 192 / 255.0, alpha: 1)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(red: 0.24, green: 0.24, blue: 0.24, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
        return label
    }()
    
    lazy var discoverButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.setTitleColor(UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 4, left: 8, bottom: 4, right: 8)
        button.backgroundColor = UIColor.init(red: 1, green: 0.9, blue: 0.92, alpha: 1)
        button.setTitle("看相似", for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        discoverButton.layer.cornerRadius = discoverButton.bounds.size.height / 2.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = UIColor.white
        
//        layer.cornerRadius = contentView.layer.cornerRadius
//        backgroundColor = UIColor.white
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize.init(width: 0, height: 2)
//        layer.shadowOpacity = 0.13

        
        contentView.addSubview(imageView)
        contentView.addSubview(brandButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(discoverButton)
        imageView.snp.makeConstraints { (maker) in
            maker.left.right.top.equalTo(0)
        }
        brandButton.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(imageView)
            maker.left.equalTo(titleLabel)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imageView.snp.bottom).offset(10)
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
        }
        priceLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(titleLabel)
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            maker.bottom.equalTo(-10)
        }
        discoverButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(-10)
            maker.centerY.equalTo(priceLabel)
        }
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCarLikeModel else {
            return
        }
        imageView.image = UIImage.init(named: model.image ?? "")
        brandButton.setImage(UIImage.init(named: model.brandImage ?? "")?.imageWith(zoom: 0.4), for: .normal)
        brandButton.setTitle(model.brandTitle, for: .normal)
        titleLabel.text = model.title
        priceLabel.text = model.price
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
