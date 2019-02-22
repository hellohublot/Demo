//
//  HTFriendPublishView.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTFriendPublishView: UIView {
    
    lazy var newsButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.init(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
        button.setTitle("发动态", for: .normal)
        let image = UIImage.init(named: "4aa2c5c22bb26e82ef83a4698891eeaa")
        button.setImage(image, for: .normal)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 3)
        return button
    }()
    
    lazy var centerSeparatorLine: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.1)
        return view
    }()
    
    lazy var videoButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.init(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
        button.setTitle("发布视频", for: .normal)
        let image = UIImage.init(named: "8cc81f771863fb9f0774c18701997848")
        button.setImage(image, for: .normal)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 6)
        return button
    }()
    
    lazy var bottomSeparatorLine: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.2)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(newsButton)
        addSubview(centerSeparatorLine)
        addSubview(videoButton)
        addSubview(bottomSeparatorLine)
        newsButton.snp.makeConstraints { (maker) in
            maker.left.top.bottom.equalTo(0)
        }
        videoButton.snp.makeConstraints { (maker) in
            maker.right.bottom.top.equalTo(0)
            maker.width.equalTo(newsButton)
            maker.left.equalTo(newsButton.snp.right)
        }
        centerSeparatorLine.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(videoButton.snp.left)
            maker.width.equalTo(1 / UIScreen.main.scale)
            maker.height.equalTo(self).multipliedBy(0.4)
            maker.centerY.equalTo(self)
        }
        bottomSeparatorLine.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(0)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
