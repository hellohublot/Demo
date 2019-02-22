//
//  HTQuestionStoreCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/3.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTQuestionStoreCell: UITableViewCell, ReuseCell {
    
    lazy var headImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = UIColor.init(white: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18)
        label.setContentHuggingPriority(UILayoutPriority.init(100), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(100), for: .horizontal)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.setContentHuggingPriority(UILayoutPriority.init(99), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority.init(99), for: .horizontal)
        return label
    }()
    
    lazy var rightImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        let image = UIImage.init(named: "55073dd9949c399450abb50c9b7955f7")
        imageView.image = image
        return imageView
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        return view
    }()
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		setHighlighted(selected, animated: animated)
	}
	
	override func setHighlighted(_ highlighted: Bool, animated: Bool) {
		super.setHighlighted(highlighted, animated: animated)
		separatorView.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)		
	}
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
        contentView.addSubview(headImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        contentView.addSubview(rightImageView)
        contentView.addSubview(separatorView)
        headImageView.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(contentView)
            maker.left.equalTo(20)
        }
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(headImageView).offset(5)
            maker.left.equalTo(headImageView.snp.right).offset(10)
            maker.right.equalTo(rightImageView.snp.left).offset(-10)
        }
        detailLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleLabel.snp.bottom).offset(5)
            maker.left.equalTo(titleLabel)
            maker.right.equalTo(rightImageView.snp.left).offset(-10)
        }
        rightImageView.snp.makeConstraints { (maker) in
            maker.right.equalTo(-20)
            maker.centerY.equalTo(contentView)
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
        guard let model = model as? HTQuestionStoreModel else {
            return
        }
        headImageView.image = UIImage.init(named: model.image ?? "")
        titleLabel.text = model.title
        detailLabel.attributedText = {
            let attributedString = NSMutableAttributedString.init()
            let fullAttachment = NSTextAttachment.init()
            let font = UIFont.init(name: "PingFangSC-Light", size: 14) ?? UIFont.systemFont(ofSize: 14)
            let fullImage = UIImage.init(named: "0828200b5deb2031d25b6703fcfdacd7")?.imageInsert(UIColor.clear, UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 2.5))
            fullAttachment.image = fullImage
            fullAttachment.bounds = CGRect.init(x: 0, y: (font.ascender + font.descender - (fullImage?.size.height ?? 0)) / 2.0, width: fullImage?.size.width ?? 0, height: fullImage?.size.height ?? 0)
            let emptyAttachment = NSTextAttachment.init()
            let emptyImage = UIImage.init(named: "653f5d0265ccc40718a63e684d8ad01b")?.imageInsert(UIColor.clear, UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 2.5))
            emptyAttachment.image = emptyImage
            emptyAttachment.bounds = CGRect.init(x: 0, y: (font.ascender + font.descender - (emptyImage?.size.height ?? 0)) / 2.0, width: emptyImage?.size.width ?? 0, height: emptyImage?.size.height ?? 0)
            for _ in 0..<model.fullStarCount {
                attributedString.append(NSAttributedString.init(attachment: fullAttachment))
            }
            for _ in model.fullStarCount..<3 {
                attributedString.append(NSAttributedString.init(attachment: emptyAttachment))
            }
            attributedString.append(NSAttributedString.init(string: model.detail ?? "", attributes: [
                .font: font,
                .foregroundColor: UIColor.init(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
            ]))
            return attributedString
        }()
        separatorView.snp.updateConstraints { (maker) in
            maker.left.equalTo(model.separatorInset.left)
            maker.right.equalTo(-model.separatorInset.right)
            maker.bottom.equalTo(model.separatorInset.top - model.separatorInset.bottom)
        }
    }

}
