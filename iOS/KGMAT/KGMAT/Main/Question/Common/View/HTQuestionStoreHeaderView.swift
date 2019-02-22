//
//  HTQuestionStoreHeaderView.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTQuestionStoreHeaderView: UITableViewHeaderFooterView, ReuseCell {
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
        button.isUserInteractionEnabled = false
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(titleButton)
        titleButton.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTQuestionSectionModel else {
            return
        }
        titleButton.setTitle(model.title, for: .normal)
    }

}
