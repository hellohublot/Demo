//
//  HTCarLikeFooterView.swift
//  Tmall
//
//  Created by hublot on 2018/11/29.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCarLikeFooterView: UICollectionReusableView, ReuseCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        let image = UIImage.init(named: "4c16882761e5d28d37cccd11ed10d3dc")
        imageView.image = image
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.center.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCarSectionModel else {
            return
        }
    }
    
}
