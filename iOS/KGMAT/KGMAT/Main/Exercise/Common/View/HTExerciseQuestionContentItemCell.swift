//
//  HTExerciseQuestionContentItemCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseQuestionContentItemCell: UITableViewCell, ReuseCell {
	
	lazy var whiteContentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.layer.cornerRadius = 5
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize.zero
		view.layer.shadowRadius = 4
		view.layer.shadowOpacity = 0.15
		return view
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
		return label
	}()
	
	lazy var detailLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.init(name: ".SFUIText-Light", size: 16)
		label.textColor = UIColor.init(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
		return label
	}()
	
	lazy var progressView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = UIColor.clear
		selectedBackgroundView = UIImageView.init(image: UIImage.from(UIColor.clear))
		contentView.addSubview(whiteContentView)
		whiteContentView.addSubview(titleLabel)
		whiteContentView.addSubview(detailLabel)
		whiteContentView.addSubview(progressView)
		whiteContentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: 0, left: 15, bottom: 10, right: 15))
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.top.equalTo(15)
		}
		detailLabel.snp.makeConstraints { (maker) in
			maker.right.equalTo(-15)
			maker.centerY.equalTo(titleLabel)
		}
		progressView.snp.makeConstraints { (maker) in
			maker.top.equalTo(titleLabel.snp.bottom).offset(20)
			maker.height.equalTo(6)
			maker.left.equalTo(titleLabel)
			maker.right.equalTo(detailLabel)
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		progressView.layer.cornerRadius = progressView.bounds.size.height / 2
	}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setHighlighted(selected, animated: animated)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        whiteContentView.backgroundColor = UIColor.white
        progressView.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseQuestionItemModel else {
			return
		}
		titleLabel.text = model.title
		detailLabel.text = model.text
	}

}
