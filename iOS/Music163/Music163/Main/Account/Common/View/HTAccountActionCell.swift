//
//  HTAccountActionCell.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTAccountActionCell: UITableViewCell, ReuseCell {
	
	lazy var titleImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		return imageView
	}()
	
	lazy var centerTitleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 17)
		label.textColor = UIColor.init(red: 0.71, green: 0.18, blue: 0.17, alpha: 1)
		return label
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		label.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
		label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
		return label
	}()
	
	lazy var accessoryImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "5c3f8097dca6accc038b9a42ea6a3dc2")
		imageView.image = image
		return imageView
	}()
	
	lazy var detailButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		button.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12), for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: -5)
		button.setContentHuggingPriority(UILayoutPriority.init(99), for: .horizontal)
		button.setContentCompressionResistancePriority(UILayoutPriority.init(99), for: .horizontal)
		button.contentHorizontalAlignment = .right
		button.isUserInteractionEnabled = false
		button.imageView?.layer.masksToBounds = true
		return button
	}()
	
	lazy var switchControl: UISwitch = {
		let control = UISwitch.init(frame: CGRect.zero)
		control.onTintColor = UIColor.init(red: 0.482353, green: 0.160784, blue: 0.164706, alpha: 1)
		control.thumbTintColor = UIColor.init(red: 0.176471, green: 0.172549, blue: 0.188235, alpha: 1)
		control.tintColor = UIColor.init(red: 0.482353, green: 0.160784, blue: 0.164706, alpha: 1)
		return control
	}()
	
	lazy var separatorLine: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05)
		return view
	}()
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = UIColor.clear
		selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.05)))
		contentView.addSubview(titleImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(detailButton)
		contentView.addSubview(switchControl)
		contentView.addSubview(accessoryImageView)
		contentView.addSubview(separatorLine)
		contentView.addSubview(centerTitleLabel)
		titleImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.centerY.equalTo(contentView)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleImageView.snp.right).offset(10)
			maker.centerY.equalTo(contentView)
		}
		detailButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel.snp.right).offset(10)
			maker.centerY.equalTo(contentView)
		}
		switchControl.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(contentView)
			maker.width.equalTo(0)
			maker.right.equalTo(-10)
		}
		accessoryImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(detailButton.snp.right).offset(10)
			maker.right.equalTo(-10)
			maker.centerY.equalTo(contentView)
		}
		separatorLine.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.right.equalTo(0)
			maker.bottom.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
		}
		centerTitleLabel.snp.makeConstraints { (maker) in
			maker.center.equalTo(contentView)
		}
	}
	
	func hiddenCenterTitleLabel(_ hidden: Bool) {
		centerTitleLabel.isHidden = hidden
		titleImageView.isHidden = !hidden
		titleLabel.isHidden = !hidden
		detailButton.isHidden = !hidden
		switchControl.isHidden = !hidden
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTAccountActionModel else {
			return
		}
		separatorLine.isHidden = !(model.showSeparatorLine ?? false)
		accessoryImageView.isHidden = !(model.showAccessoryImage ?? false)
		titleImageView.image = UIImage.init(named: model.image ?? "")
		titleLabel.text = model.title
		switch model.displayType {
		case .exittitle?:
			hiddenCenterTitleLabel(false)
			centerTitleLabel.text = model.title
		case .largeImage?, .smallImage?, .titleImage?:
			hiddenCenterTitleLabel(true)
			detailButton.setTitle(model.detailTitle, for: .normal)
			var image = UIImage.init(named: model.detailImage ?? "")
			let height: CGFloat = 26
			detailButton.imageView?.layer.cornerRadius = height / 2.0
			image = image?.imageWith(zoom: height / (image?.size.height ?? 1))
			detailButton.setImage(image, for: .normal)
			switchControl.isHidden = true
			switchControl.snp.updateConstraints { (maker) in
				maker.width.equalTo(0)
			}
		case .switchcontrol?:
			hiddenCenterTitleLabel(true)
			switchControl.isOn = model.selected ?? false
			switchControl.isHidden = false
			switchControl.snp.updateConstraints { (maker) in
				maker.width.equalTo(50)
			}
		default:
			break
		}
	}
	
}
