//
//  HTMineUserCircleView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineUserCircleView: UIView, ReuseCell {

    lazy var imageButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.isUserInteractionEnabled = false
        button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: 5, bottom: 2, right: 5)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleButton)
        addSubview(imageButton)
        imageButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.centerY.equalTo(self)
        }
        titleButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(imageButton.snp.right).offset(-5)
            maker.centerY.equalTo(imageButton)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTMineUserCircleModel else {
            return
        }
        imageButton.setBackgroundImage(UIImage.init(named: model.imageButtonBackgroundImage ?? ""), for: .normal)
        imageButton.setImage(UIImage.init(named: model.imageButtonImage ?? ""), for: .normal)
        titleButton.setBackgroundImage(UIImage.init(named: model.titleButtonBackgroundImage ?? ""), for: .normal)
        titleButton.setTitleColor(model.titleButtonTitleColor, for: .normal)
        titleButton.setTitle(model.titleButtonTitle, for: .normal)
    }
    
}
