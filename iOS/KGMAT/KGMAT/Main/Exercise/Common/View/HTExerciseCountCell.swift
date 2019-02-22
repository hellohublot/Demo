//
//  HTExerciseCountCell.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTExerciseCountCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.numberOfLines = 2
		return label
	}()
	
	lazy var lineView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)		
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleLabel)
		contentView.addSubview(lineView)
		titleLabel.snp.makeConstraints { (maker) in
			maker.center.equalTo(contentView)
		}
		lineView.snp.makeConstraints { (maker) in
			maker.left.equalTo(contentView.snp.right)
			maker.height.equalTo(contentView).multipliedBy(0.5)
			maker.centerY.equalTo(contentView)
			maker.width.equalTo(1 / UIScreen.main.scale)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTExerciseCountModel else {
			return
		}
		titleLabel.attributedText = {
			let attributedString = NSMutableAttributedString.init()
			attributedString.append(NSAttributedString.init(string: model.title ?? "", attributes: [
				.font: UIFont.systemFont(ofSize: 36),
				.foregroundColor: UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
			]))
			attributedString.append(NSAttributedString.init(string: (model.detail ?? ""), attributes: [
				.font: UIFont.systemFont(ofSize: 14),
				.foregroundColor: UIColor.init(red: 0.66, green: 0.66, blue: 0.66, alpha: 1) 
			]))
			attributedString.append(NSAttributedString.init(string: "\n" + (model.text ?? ""), attributes: [
				.font: UIFont.systemFont(ofSize: 14),
				.foregroundColor: UIColor.init(red: 0.66, green: 0.66, blue: 0.66, alpha: 1) 
			]))
			let paragraphStyle = NSMutableParagraphStyle.init()
			paragraphStyle.alignment = .center
			paragraphStyle.lineSpacing = 3
			attributedString.addAttributes([
				.paragraphStyle: paragraphStyle,
			], range: NSRange.init(location: 0, length: attributedString.length))
			attributedString.addAttributes([
				.kern: 2
			], range: NSRange.init(location: (model.title?.count ?? 1) - 1, length: 1))
			return attributedString
		}()
	}
    
}
