//
//  HTMusicPlayerLyricCell.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTMusicPlayerLyricCell: UITableViewCell, ReuseCell {

	static let width = UIScreen.main.bounds.size.width - 80

	static let font = UIFont.systemFont(ofSize: 16)

	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor.init(white: 1, alpha: 0.5)
		label.highlightedTextColor = UIColor.init(white: 1, alpha: 1)
		label.numberOfLines = 0
		label.textAlignment = .center
		return label
	}()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = UIColor.clear
		contentView.addSubview(titleLabel)
		titleLabel.snp.makeConstraints { (maker) in
			maker.top.bottom.equalTo(contentView)
			maker.width.equalTo(type(of: self).width)
			maker.centerX.equalTo(contentView)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTMusicPlayerLyricModel else {
			return
		}
		titleLabel.text = model.title
		titleLabel.isHighlighted = model.selected ?? false
	}

}
