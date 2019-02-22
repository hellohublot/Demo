//
//  HTCarLikeHeaderView.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCarLikeHeaderView: UICollectionReusableView, ReuseCell {
    
    lazy var leftLineView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.08)
        return view
    }()
    
    lazy var rightLineView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.08)
        return view
    }()
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), for: .normal)
        let image = UIImage.init(named: "72041fdab4bdf43b2f56e17ec00f3950")?.imageWith(zoom: 0.5)
        button.setImage(image, for: .normal)
        button.setTitle("猜你喜欢", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftLineView)
        addSubview(titleButton)
        addSubview(rightLineView)
        leftLineView.snp.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.centerY.equalTo(titleButton)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
        rightLineView.snp.makeConstraints { (maker) in
            maker.right.equalTo(-10)
            maker.centerY.equalTo(leftLineView)
            maker.height.equalTo(leftLineView)
            maker.width.equalTo(leftLineView)
        }
        titleButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(leftLineView.snp.right)
            maker.right.equalTo(rightLineView.snp.left)
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
    }
    
}
