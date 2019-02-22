//
//  HTFriendSegmentedControl.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import SnapKit

class HTFriendSegmentedControl: UIView {
    
    var segmentedDidSelected: ((_ index: Int) -> Void)?
    
    let titleList = ["动态", "附近"]
    
    func createButton() -> UIButton {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }
    
    lazy var upButtonContentView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.isUserInteractionEnabled = false
        view.layer.mask = sliderMask.layer
        return view
    }()
    
    lazy var downButtonContentView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        return view
    }()
    
    lazy var sliderView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 0.29, green: 0.29, blue: 0.29, alpha: 1)
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var sliderMask: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.orange
        view.layer.masksToBounds = true
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height / 2.0
        sliderView.layer.cornerRadius = layer.cornerRadius
        sliderMask.layer.cornerRadius = layer.cornerRadius
        sliderView.frame = CGRect.init(x: 0, y: 0, width: bounds.size.width / CGFloat(titleList.count), height: bounds.size.height)
        sliderMask.frame = sliderView.frame
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.init(red: 91 / 255.0, green: 91 / 255.0, blue: 91 / 255.0, alpha: 1).cgColor
        layer.borderWidth = 1 / UIScreen.main.scale
        layer.masksToBounds = true
        
        for (index, title) in titleList.enumerated() {
            let upButton = createButton()
            let downButton = createButton()
            upButton.setTitle(title, for: .normal)
            upButton.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .normal)
            downButton.setTitle(title, for: .normal)
            downButton.setTitleColor(UIColor.init(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
            downButtonContentView.addSubview(downButton)
            upButtonContentView.addSubview(upButton)
            let constraintsBlock: ((_: ConstraintMaker, _: UIView) -> Void) = { (maker, contentView) in
                maker.top.bottom.equalTo(0)
                if contentView.subviews.count > 1 {
                    let lastView = contentView.subviews[index - 1]
                    maker.left.equalTo(lastView.snp.right)
                    maker.width.equalTo(lastView)
                } else {
                    maker.left.equalTo(0)
                }
                if index == self.titleList.count - 1 {
                    maker.right.equalTo(0)
                }
            }
            downButton.snp.makeConstraints { (maker) in
                constraintsBlock(maker, downButtonContentView)
            }
            upButton.snp.makeConstraints { (maker) in
                constraintsBlock(maker, upButtonContentView)
            }
            
            downButton.whenTouch(inside: { [weak self] (_, _) in
                self?.buttonTouchInside(index)
            }, receive: nil)
        }
        addSubview(sliderView)
        addSubview(downButtonContentView)
        addSubview(upButtonContentView)
        downButtonContentView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
        upButtonContentView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    func buttonTouchInside(_ index: Int) {
        self.segmentedDidSelected?(index)
        UIView.animate(withDuration: 0.25) {
            self.sliderView.frame.origin.x = (self.bounds.size.width / CGFloat(self.titleList.count)) * CGFloat(index)
            self.sliderMask.frame = self.sliderView.frame
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
