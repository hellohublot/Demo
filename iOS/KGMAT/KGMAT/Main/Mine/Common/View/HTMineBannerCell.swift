//
//  HTMineBannerCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift
import HTScrollPageView

class HTMineBannerCell: UITableViewCell, ReuseCell {
    
    var removeButtonTouchInside: (() -> Void)?
    
    var modelArray = [HTMineBannerModel]()
    
    lazy var bannerView: HTScrollPageView = {
        let bannerView = HTScrollPageView.init(frame: CGRect.zero)
        return bannerView
    }()
    
    lazy var removeButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        let image = UIImage.init(named: "804049b495b885cb6005d2e40b0b5b5f")
        button.setImage(image, for: .normal)
        button.whenTouch(inside: { [weak self] (_, _) in
            self?.removeButtonTouchInside?()
        })
        return button
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(bannerView)
        contentView.addSubview(removeButton)
        contentView.addSubview(separatorView)
        bannerView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        removeButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(-5)
            maker.top.equalTo(5)
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
        guard let model = model as? [HTMineBannerModel], model != modelArray else {
            return
        }
        modelArray = model
        bannerView.delegate = self
        bannerView.reloadData()
    }

}

extension HTMineBannerCell: HTScrollPageDelegate {
    
    func number(of pageView: HTScrollPageView!) -> Int {
        return modelArray.count
    }
    
    func buttonInitPageView(_ pageView: HTScrollPageView!, button: UIButton!) {
        button.isUserInteractionEnabled = false
    }
    
    func buttonWillDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
        let model = modelArray[indexRow]
        button.setImage(UIImage.init(named: model.image ?? ""), for: .normal)
    }
    
    func buttonDidDisplay(_ pageView: HTScrollPageView!, button: UIButton!, indexRow: Int) {
        
    }
    
}
