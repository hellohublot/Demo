//
//  HTCarGoodCell.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCarGoodCell: UICollectionViewCell, ReuseCell {
    
    lazy var selectedButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        let image = UIImage.init(named: "fe285469c02f9fcae3f795086d77ce01")
        let selectedImage = UIImage.init(named: "76e35a40ed9e389f5391000d97e4fde2")
        button.setImage(image, for: .normal)
        button.setImage(image, for: [.normal, .highlighted])
        button.setImage(selectedImage, for: .selected)
        button.setImage(selectedImage, for: [.normal, .selected])
        button.setContentHuggingPriority(UILayoutPriority.init(900), for: .horizontal)
        button.setContentCompressionResistancePriority(UILayoutPriority.init(900), for: .horizontal)
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var firstTagButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 4, bottom: 2, right: 4)
        button.backgroundColor = UIColor.init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        button.layer.cornerRadius = 2
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(selectedButton)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(firstTagButton)
        contentView.addSubview(priceLabel)
        selectedButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.centerY.equalTo(contentView)
        }
        imageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(selectedButton.snp.right).offset(10)
            maker.top.equalTo(10)
            maker.bottom.equalTo(-10)
            maker.width.equalTo(imageView.snp.height)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imageView)
            maker.left.equalTo(imageView.snp.right).offset(10)
            maker.right.equalTo(-10)
        }
        firstTagButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(titleLabel)
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        priceLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(titleLabel)
            maker.bottom.equalTo(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCarGoodModel else {
            return
        }
        selectedButton.isSelected = model.selected ?? false
        imageView.image = UIImage.init(named: model.image ?? "")
        titleLabel.text = model.title
        firstTagButton.setTitle(model.selectedList?.first, for: .normal)
        priceLabel.text = model.price
    }
    
}
