//
//  HTCourseReplayCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTCourseReplayCell: UICollectionViewCell, ReuseCell {
	
	lazy var flagButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.white, for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 20)
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.numberOfLines = 2
		label.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		label.setContentHuggingPriority(UILayoutPriority.init(100), for: .vertical)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .vertical)
		return label
	}()
	
	lazy var teacherButtton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 10)
		return button
	}()
	
	lazy var visitButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.52, green: 0.52, blue: 0.52, alpha: 1), for: .normal)
		let image = UIImage.init(named: "f0250a10fad1ddb4c625a76dc1ea9908")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
		return button
	}()
	
	lazy var likeButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.52, green: 0.52, blue: 0.52, alpha: 1), for: .normal)
		let image = UIImage.init(named: "6cf3ed25c9e9090d8d67835ae18895a4")
		button.setImage(image, for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
		return button
	}()
	
	lazy var teacherImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		imageView.setContentHuggingPriority(UILayoutPriority.init(101), for: .horizontal)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(101), for: .horizontal)
		imageView.setContentHuggingPriority(UILayoutPriority.init(101), for: .vertical)
		imageView.setContentCompressionResistancePriority(UILayoutPriority.init(101), for: .vertical)
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.backgroundColor = UIColor.white
		contentView.layer.cornerRadius = 4
		contentView.layer.shadowColor = UIColor.init(red: 0.109804, green: 0.160784, blue: 0.372549, alpha: 1).cgColor
		contentView.layer.shadowOffset = CGSize.init(width: 0, height: 3)
		contentView.layer.shadowOpacity = 0.11
		contentView.layer.shadowRadius = 12
		contentView.layer.borderColor = UIColor.init(red: 0.941176, green: 0.941176, blue: 0.941176, alpha: 1).cgColor
		contentView.layer.borderWidth = 1 / UIScreen.main.scale
		
		contentView.addSubview(flagButton)
		contentView.addSubview(titleLabel)
		contentView.addSubview(teacherButtton)
		contentView.addSubview(visitButton)
		contentView.addSubview(likeButton)
		contentView.addSubview(teacherImageView)
		flagButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(0)
			maker.top.equalTo(12)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.right.equalTo(teacherImageView.snp.left).offset(-5)
			maker.top.equalTo(flagButton.snp.bottom).offset(15)
		}
		teacherButtton.snp.makeConstraints { (maker) in
			maker.top.equalTo(titleLabel.snp.bottom).offset(20)
			maker.left.equalTo(titleLabel)
		}
		visitButton.snp.makeConstraints { (maker) in
			maker.top.equalTo(teacherButtton.snp.bottom).offset(10)
			maker.bottom.equalTo(-15)
			maker.left.equalTo(teacherButtton)
		}
		likeButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(visitButton.snp.right).offset(10)
			maker.centerY.equalTo(visitButton)
		}
		teacherImageView.snp.makeConstraints { (maker) in
			maker.right.equalTo(0)
			maker.bottom.equalTo(0)
			maker.width.equalTo(110)
			maker.top.equalTo(flagButton.snp.bottom)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTCourseReplayModel else {
			return
		}
		flagButton.setTitle(model.flagTitle, for: .normal)
		flagButton.setBackgroundImage(UIImage.init(named: model.flagImage ?? "")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 30)), for: .normal)
		titleLabel.attributedText = {
			let attributedString = NSMutableAttributedString.init()
			let paragraphStyle = NSMutableParagraphStyle.init()
			paragraphStyle.lineSpacing = 5
			attributedString.append(NSAttributedString.init(string: model.title ?? "", attributes: [
				.font: UIFont.init(name: ".SFUIText-Medium", size: 18) ?? UIFont.init(),
				.foregroundColor: UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1),
				.paragraphStyle: paragraphStyle
			]))
			return attributedString
		}()
		teacherButtton.setTitle(model.teacherTitle, for: .normal)
		teacherButtton.setImage(UIImage.init(named: model.teacherImage ?? ""), for: .normal)
		visitButton.setTitle((model.teacherVisitCount ?? "") + " 次", for: .normal)
		likeButton.setTitle(model.teacherLikeCount, for: .normal)
		teacherImageView.image = UIImage.init(named: model.teacherHeadImage ?? "")
	}
    
}
