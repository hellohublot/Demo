//
//  HTCourseStoryCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseStoryCell: UITableViewCell, ReuseCell {
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.init(red: 0.858824, green: 0.858824, blue: 0.858824, alpha: 1).cgColor
        imageView.layer.borderWidth = 1 / UIScreen.main.scale
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var studentNameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.init(name: ".SFUIText-Medium", size: 18)
        label.textColor = UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
        return label
    }()
    
    lazy var studentDateLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        return label
    }()
    
    lazy var firstScoreButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        button.backgroundColor = UIColor.init(white: 0, alpha: 1)
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var secondScoreButton: UIButton = {
        let button = UIButton.init(frame: CGRect.zero)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        button.backgroundColor = UIColor.init(white: 0, alpha: 1)
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var studentStoryLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.numberOfLines = 3
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headImageView.layer.cornerRadius = headImageView.bounds.size.height / 2.0
        firstScoreButton.layer.cornerRadius = firstScoreButton.bounds.size.height / 2.0
        secondScoreButton.layer.cornerRadius = secondScoreButton.layer.bounds.height / 2.0
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        addSubview(headImageView)
        contentView.addSubview(studentNameLabel)
        contentView.addSubview(studentDateLabel)
        addSubview(firstScoreButton)
        addSubview(secondScoreButton)
        contentView.addSubview(studentStoryLabel)
        headImageView.snp.makeConstraints { (maker) in
            maker.top.equalTo(10)
            maker.left.equalTo(15)
            maker.width.height.equalTo(48)
        }
        studentNameLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(headImageView.snp.right).offset(10)
            maker.top.equalTo(headImageView).offset(1.5)
        }
        studentDateLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(studentNameLabel)
            maker.bottom.equalTo(headImageView).offset(-1.5)
        }
        firstScoreButton.snp.makeConstraints { (maker) in
            maker.left.equalTo(headImageView)
            maker.top.equalTo(headImageView.snp.bottom).offset(15)
        }
        secondScoreButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(firstScoreButton)
            maker.left.equalTo(firstScoreButton.snp.right).offset(8)
        }
        studentStoryLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(headImageView)
            maker.top.equalTo(firstScoreButton.snp.bottom).offset(20)
            maker.right.equalTo(-15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(_ model: Any?, for indexPath: IndexPath) {
        guard let model = model as? HTCourseStoryModel else {
            return
        }
        headImageView.image = UIImage.init(named: model.studentImage ?? "")
        studentNameLabel.text = model.studentTitle
        studentDateLabel.text = model.studentDate
        firstScoreButton.setTitle(model.scoreTitleList.first, for: .normal)
        secondScoreButton.setTitle(model.scoreTitleList.last, for: .normal)
		studentStoryLabel.attributedText = {
			let attributedString = NSMutableAttributedString.init()
			let paragraphStyle = NSMutableParagraphStyle.init()
			paragraphStyle.lineSpacing = 5
			attributedString.append(NSAttributedString.init(string: model.text ?? "", attributes: [
				.font: UIFont.init(name: ".SFUIText-Light", size: 14) ?? UIFont.init(),
				.foregroundColor: UIColor.init(red: 0.64, green: 0.64, blue: 0.64, alpha: 1),
				.paragraphStyle: paragraphStyle
			]))
			return attributedString
		}()
        studentStoryLabel.text = model.text
    }

}
