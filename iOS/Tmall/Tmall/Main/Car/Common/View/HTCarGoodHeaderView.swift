//
//  HTCarGoodHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCarGoodHeaderView: UICollectionReusableView, ReuseCell {
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        let image = UIImage.init(named: "fe285469c02f9fcae3f795086d77ce01")
        let selectedImage = UIImage.init(named: "76e35a40ed9e389f5391000d97e4fde2")
        button.setImage(image, for: .normal)
        button.setImage(image, for: [.normal, .highlighted])
        button.setImage(selectedImage, for: .selected)
        button.setImage(selectedImage, for: [.normal, .selected])
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 10)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(titleButton)
        titleButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.centerY.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCarSectionModel else {
            return
        }
        titleButton.setTitle(model.title, for: .normal)
        titleButton.isSelected = model.selected ?? false
    }
    
}
