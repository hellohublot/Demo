//
//  HTMineHeaderCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMineUserCell: UITableViewCell, ReuseCell {
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: ".SFUIDisplay", size: 24)
        label.textColor = UIColor.init(white: 0, alpha: 1)
        return label
    }()
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        let image = UIImage.init(named: "41e21da5ca5e690e7dc6710e386da97e")
        imageView.image = image
        return imageView
    }()
    
    lazy var levelCircleView: HTMineUserCircleView = {
        let circleView = HTMineUserCircleView.init(frame: CGRect.zero)
        return circleView
    }()
    
    lazy var energyCircleView: HTMineUserCircleView = {
        let circleView = HTMineUserCircleView.init(frame: CGRect.zero)
        return circleView
    }()
    
    lazy var dateEditButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.init(name: "PingFangSC-Light", size: 14)
        button.setTitleColor(UIColor.init(red: 0.48, green: 0.48, blue: 0.48, alpha: 1), for: .normal)
        let image = UIImage.init(named: "195147ffa0e542a7eac1fbe8f41084dd")
        button.setImage(image, for: .normal)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -8)
        return button
    }()
    
    lazy var signDateButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.init(name: "PingFangSC-Regular", size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        let backgroundImage = UIImage.init(named: "55b5a976db504404f58107c9e6d8b483")
        button.setBackgroundImage(backgroundImage, for: .normal)
        let image = UIImage.init(named: "686fcef5485f1466de5fd4441f991871")
        button.setImage(image, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 20, bottom: 8, right: 20)
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
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
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(headImageView)
        contentView.addSubview(levelCircleView)
        contentView.addSubview(energyCircleView)
        contentView.addSubview(dateEditButton)
        contentView.addSubview(signDateButton)
        contentView.addSubview(separatorView)
        nicknameLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(headImageView).offset(-5)
            maker.left.equalTo(20)
        }
        headImageView.snp.makeConstraints { (maker) in
            maker.right.equalTo(-20)
            maker.bottom.equalTo(levelCircleView).offset(-5)
        }
        levelCircleView.snp.makeConstraints { (maker) in
            maker.left.equalTo(nicknameLabel)
            maker.bottom.equalTo(dateEditButton.snp.top).offset(-20)
            maker.width.equalTo(50)
            maker.height.equalTo(30)
        }
        energyCircleView.snp.makeConstraints { (maker) in
            maker.left.equalTo(levelCircleView.snp.right).offset(10)
            maker.bottom.width.height.equalTo(levelCircleView)
        }
        dateEditButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(levelCircleView)
            maker.bottom.equalTo(signDateButton.snp.top).offset(-15)
        }
        signDateButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(0)
            maker.bottom.equalTo(-25)
        }
        separatorView.snp.makeConstraints { (maker) in
            maker.bottom.left.right.equalTo(0)
            maker.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTMineUserModel else {
            return
        }
        nicknameLabel.text = "hublot"
        levelCircleView.setModel(model.circleModelArray.first, for: indexPath)
        energyCircleView.setModel(model.circleModelArray.last, for: indexPath)
        dateEditButton.setTitle("12月31日考试，目标 600", for: .normal)
        signDateButton.setTitle("打卡签到 Day 3", for: .normal)
    }

}
