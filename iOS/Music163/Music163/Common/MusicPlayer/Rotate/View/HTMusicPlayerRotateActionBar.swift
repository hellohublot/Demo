//
//  HTMusicPlayerRotateActionView.swift
//  Music163
//
//  Created by hublot on 2018/12/22.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerRotateActionBar: UIView {

	lazy var likeButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "fe843ea522f750e10ce868b7f647459f")
		button.setImage(image, for: .normal)
		return button
	}()

	lazy var downloadButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "3c1555991944a01eb9e234b05de0e00b")
		button.setImage(image, for: .normal)
		return button
	}()

	lazy var whaleButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "1f375dbdb7e2aca577515c455ff07f29")
		button.setImage(image, for: .normal)
		return button
	}()

	lazy var replyButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "3e04aae2a1ec19123d3adf14a848b021")
		button.setImage(image, for: .normal)
		return button
	}()

	lazy var replyLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 9)
		label.textColor = UIColor.white
		label.text = "1w+"
		return label
	}()

	lazy var moreButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "81777dfe819f22337470174be6431c64")
		button.setImage(image, for: .normal)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(likeButton)
		addSubview(downloadButton)
		addSubview(whaleButton)
		addSubview(replyButton)
		addSubview(replyLabel)
		addSubview(moreButton)
		whaleButton.snp.makeConstraints { (maker) in
			maker.center.equalTo(self)
		}
		likeButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(UIScreen.main.bounds.size.width / 6.0)
			maker.centerY.equalTo(self)
		}
		downloadButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(UIScreen.main.bounds.size.width / 6.0 * 2)
		}
		replyButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(UIScreen.main.bounds.size.width / 6.0 * 4)
		}
		replyLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(replyButton.snp.right).offset(-13)
			maker.top.equalTo(replyButton).offset(4)
		}
		moreButton.snp.makeConstraints { (maker) in
			maker.centerX.equalTo(UIScreen.main.bounds.size.width / 6.0 * 5)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
