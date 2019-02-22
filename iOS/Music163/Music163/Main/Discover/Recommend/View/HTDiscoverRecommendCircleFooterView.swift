//
//  HTDiscoverRecommendCircleFooterView.swift
//  Music163
//
//  Created by hublot on 2018/12/13.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTDiscoverRecommendCircleFooterView: UICollectionReusableView, ReuseCell {
    
    lazy var separatorLine: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(separatorLine)
        separatorLine.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(0)
            maker.centerY.equalTo(self)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        
    }
    
}
