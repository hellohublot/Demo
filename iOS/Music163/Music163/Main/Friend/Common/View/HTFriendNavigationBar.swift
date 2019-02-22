//
//  HTFriendNavigationBar.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTFriendNavigationBar: UIView {

    static let navigationBarHeight: CGFloat = HTStatic.navigationHeight + 40
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blueEffectView = UIVisualEffectView.init(frame: CGRect.zero)
        blueEffectView.effect = UIBlurEffect.init(style: UIBlurEffectStyle.dark)
        return blueEffectView
    }()
    
    lazy var navigationContentView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        return view
    }()
    
    lazy var appendButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        let image = UIImage.init(named: "c9c21ad0d1bfbf9f9405788002bca47d")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var segmentedControl: HTFriendSegmentedControl = {
        let segmentedControl = HTFriendSegmentedControl.init(frame: CGRect.zero)
        return segmentedControl
    }()
    
    lazy var publishView: HTFriendPublishView = {
        let publishView = HTFriendPublishView.init(frame: CGRect.zero)
        return publishView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(blurEffectView)
        blurEffectView.contentView.addSubview(navigationContentView)
        navigationContentView.addSubview(appendButton)
        navigationContentView.addSubview(segmentedControl)
        blurEffectView.contentView.addSubview(publishView)
        blurEffectView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        navigationContentView.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(self)
            maker.top.equalTo(HTStatic.statusHeight)
            maker.height.equalTo(HTStatic.navigationHeight - HTStatic.statusHeight)
        }
        appendButton.snp.makeConstraints { (maker) in
            maker.width.equalTo(HTTabbarController.playContentWidth)
            maker.left.top.bottom.equalTo(navigationContentView)
        }
        segmentedControl.snp.makeConstraints { (maker) in
            maker.center.equalTo(navigationContentView)
            maker.width.equalTo(140)
            maker.height.equalTo(navigationContentView).offset(-15)
        }
        publishView.snp.makeConstraints { (maker) in
            maker.top.equalTo(navigationContentView.snp.bottom)
            maker.left.right.bottom.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
