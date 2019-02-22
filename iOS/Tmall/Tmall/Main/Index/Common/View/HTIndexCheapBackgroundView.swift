//
//  HTIndexCheapBackgroundView.swift
//  Tmall
//
//  Created by hublot on 2018/12/9.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTIndexCheapBackgroundView: UICollectionReusableView, ReuseCell {
    
    lazy var backgroundView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 248 / 255.0, green: 248 / 255.0, blue: 248 / 255.0, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        
    }
    
}
