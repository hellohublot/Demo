//
//  HTCourseLiveCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseLiveCell: UITableViewCell, ReuseCell {
    
    public static func modelSize(_ model: NSObject?, _ superSize: CGSize) -> CGSize {
        guard let model = model as? HTCourseLiveModel else {
            return CGSize.zero
        }
        let height = 185 + min((model.text?.size(superSize).height ?? 0), 2 * 20)
        return CGSize.init(width: superSize.width, height: height)
    }
    
    lazy var timeLineView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.backgroundColor = UIColor.init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        return view
    }()
    
    lazy var timeImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        let image = UIImage.init(named: "3a14d427a3aadb6e384160781564dc73")
        imageView.image = image
        return imageView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: ".SFUIDisplay-Medium", size: 30)
        label.textColor = UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
        return label
    }()
    
    lazy var liveRemindButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.init(name: ".SFUIText-Medium", size: 14)
        button.setTitleColor(UIColor.init(red: 0.26, green: 0.51, blue: 0.94, alpha: 1), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 7, left: 17, bottom: 7, right: 17)
        button.layer.borderColor = UIColor.init(red: 44 / 255.0, green: 162 / 255.0, blue: 241 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1 / UIScreen.main.scale
        button.layer.masksToBounds = true
        button.setTitle("开播提醒", for: .normal)
        return button
    }()
    
    lazy var flagButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 20)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.init(red: 0.31, green: 0.31, blue: 0.32, alpha: 1)
        label.setContentHuggingPriority(UILayoutPriority.init(101), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(101), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(101), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(101), for: .vertical)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.numberOfLines = 2
        label.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
        return label
    }()
    
    lazy var teacherButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.layer.masksToBounds = true
        button.imageView?.layer.borderColor = UIColor.init(red: 0.858824, green: 0.858824, blue: 0.858824, alpha: 1).cgColor
        button.imageView?.layer.borderWidth = 1 / UIScreen.main.scale
        button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 10)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        liveRemindButton.layer.cornerRadius = liveRemindButton.bounds.size.height / 2.0
        teacherButton.imageView?.layer.cornerRadius = (teacherButton.imageView?.bounds.size.height ?? 0) / 2.0
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        contentView.addSubview(timeLineView)
        contentView.addSubview(timeImageView)
        contentView.addSubview(timeLabel)
        addSubview(liveRemindButton)
        contentView.addSubview(flagButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        addSubview(teacherButton)
        timeImageView.snp.makeConstraints { (maker) in
            maker.left.equalTo(16)
            maker.top.equalTo(24)
        }
        timeLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeImageView.snp.right).offset(15)
            maker.centerY.equalTo(timeImageView)
        }
        liveRemindButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(-15)
            maker.centerY.equalTo(timeLabel)
        }
        flagButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeLabel)
            maker.top.equalTo(timeLabel.snp.bottom).offset(10)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeLabel)
            maker.top.equalTo(flagButton.snp.bottom).offset(15)
            maker.right.equalTo(-15)
        }
        detailLabel.snp.makeConstraints { (maker) in
            maker.left.right.equalTo(titleLabel)
            maker.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        teacherButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeLabel)
            maker.top.equalTo(detailLabel.snp.bottom).offset(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCourseLiveModel else {
            return
        }
        timeLineView.snp.remakeConstraints { (maker) in
            maker.top.equalTo(indexPath.row == 0 ? timeImageView.snp.bottom : 0)
            maker.centerX.equalTo(timeImageView)
            maker.width.equalTo(1 / UIScreen.main.scale)
            maker.bottom.equalTo(0)
        }
        timeLabel.text = model.liveTime
        flagButton.setTitle(model.flagTitle, for: .normal)
        flagButton.setBackgroundImage(UIImage.init(named: model.flagImage ?? "")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 30)), for: .normal)
        titleLabel.text = model.title
        detailLabel.attributedText = model.text
        var teacherImage = UIImage.init(named: model.teacherImage ?? "")
        teacherImage = teacherImage?.imageWith(zoom: 32 / (teacherImage?.size.width ?? 1))
        teacherButton.setImage(teacherImage, for: .normal)
        teacherButton.setTitle(model.teacherTitle, for: .normal)
    }

}
