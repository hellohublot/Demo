//
//  HTAccountUserCountCell.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTAccountUserCountCell: UICollectionViewCell, ReuseCell {
	
	lazy var titleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.ht_makeEdge(with: .vertical, imageToTitleaOffset: 4)
		button.titleLabel?.numberOfLines = 2
		return button
	}()
	
	lazy var separatorLine: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05)
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(titleButton)
		contentView.addSubview(separatorLine)
		titleButton.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		separatorLine.snp.makeConstraints { (maker) in
			maker.left.equalTo(contentView.snp.right)
			maker.width.equalTo(1 / UIScreen.main.scale)
			maker.height.equalTo(contentView).multipliedBy(0.6)
			maker.centerY.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTAccountCountModel else {
			return
		}
		switch model.displayType {
		case .title?:
			let attributedString: NSAttributedString = {
				let attributedString = NSMutableAttributedString.init()
				attributedString.append(NSAttributedString.init(string: model.title ?? "", attributes: [
					.font: UIFont.systemFont(ofSize: 12),
					.foregroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.12)
				]))
				attributedString.append(NSAttributedString.init(string: "\n" + (model.text ?? ""), attributes: [
					.font: UIFont.init(name: ".SFUIText-Semibold", size: 14) ?? UIFont(),
					.foregroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
				]))
				let paragraphStyle = NSMutableParagraphStyle.init()
				paragraphStyle.lineSpacing = 2
				paragraphStyle.alignment = .center
				attributedString.addAttributes([
					.paragraphStyle: paragraphStyle
				], range: NSRange.init(location: 0, length: attributedString.length))
				return attributedString
			}()
			titleButton.setImage(nil, for: .normal)
			titleButton.setAttributedTitle(attributedString, for: .normal)
		case .image?:
			titleButton.setImage(UIImage.init(named: model.image ?? ""), for: .normal)
			let attributedString: NSAttributedString = {
				let attributedString = NSMutableAttributedString.init()
				attributedString.append(NSAttributedString.init(string: model.title ?? "", attributes: [
					.font: UIFont.systemFont(ofSize: 11),
					.foregroundColor: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25)
				]))
				return attributedString
			}()
			titleButton.setAttributedTitle(attributedString, for: .normal)
		default:
			break
		}
	}
    
}
