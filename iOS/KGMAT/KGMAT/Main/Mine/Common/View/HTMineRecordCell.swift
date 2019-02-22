//
//  HTMineRecordCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineRecordCell: UITableViewCell, ReuseCell {
    
    lazy var titleButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.init(name: "PingFangSC-Light", size: 18)
        button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
        button.isUserInteractionEnabled = false
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 20)
        return button
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        contentView.addSubview(titleButton)
        contentView.addSubview(separatorView)
        titleButton.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        separatorView.snp.makeConstraints { (maker) in
			maker.bottom.equalTo(-10)
            maker.left.right.equalTo(0)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
    }
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		setHighlighted(selected, animated: animated)
	}
	
	override func setHighlighted(_ highlighted: Bool, animated: Bool) {
		super.setHighlighted(highlighted, animated: animated)
		separatorView.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)		
	}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTMineRecordModel else {
            return
        }
        titleButton.setImage(UIImage.init(named: model.image ?? ""), for: .normal)
        titleButton.setTitle(model.title, for: .normal)
        separatorView.snp.updateConstraints { (maker) in
            maker.left.equalTo(model.separatorInset.left)
            maker.right.equalTo(-model.separatorInset.right)
            maker.bottom.equalTo(model.separatorInset.top - model.separatorInset.bottom)
        }
    }

}
