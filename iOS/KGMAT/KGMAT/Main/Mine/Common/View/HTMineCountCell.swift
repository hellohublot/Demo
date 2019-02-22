//
//  HTMineCountCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineCountCell: UITableViewCell, ReuseCell {
    
    lazy var leftCountView: HTMineCountView = {
        let countView = HTMineCountView.init(frame: CGRect.zero)
        return countView
    }()
    
    lazy var rightCountView: HTMineCountView = {
        let countView = HTMineCountView.init(frame: CGRect.zero)
        return countView
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(leftCountView)
        contentView.addSubview(rightCountView)
        contentView.addSubview(separatorView)
        leftCountView.snp.makeConstraints { (maker) in
            maker.top.left.bottom.equalTo(0)
        }
        rightCountView.snp.makeConstraints { (maker) in
            maker.right.top.bottom.equalTo(0)
            maker.left.equalTo(leftCountView.snp.right)
            maker.width.equalTo(leftCountView)
        }
        separatorView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(0)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? [HTMineCountModel] else {
            return
        }
        leftCountView.setModel(model.first, for: indexPath)
        rightCountView.setModel(model.last, for: indexPath)
    }

}
