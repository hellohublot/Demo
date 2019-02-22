//
//  HTFriendNewsImageCell.swift
//  Music163
//
//  Created by hublot on 2018/12/20.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTFriendNewsImageCell: UICollectionViewCell, ReuseCell {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    lazy var darkView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(darkView)
        backgroundImageView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        darkView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(backgroundImageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? String else {
            return
        }
        backgroundImageView.image = UIImage.init(named: model)
    }
    
}
