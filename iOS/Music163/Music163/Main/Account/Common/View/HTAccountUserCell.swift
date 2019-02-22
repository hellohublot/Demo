//
//  HTAccountHeaderCell.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTAccountUserCell: UITableViewCell, ReuseCell {
	
	lazy var userContentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()

	lazy var headImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "8518c555e94dc509b004b78d2e564728")
		imageView.image = image
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel.init(frame: CGRect.zero)
		label.font = UIFont.systemFont(ofSize: 17)
		label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.45)
		label.text = "hublot"
		return label
	}()
	
	lazy var levelButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let left: CGFloat = 25
		var image = UIImage.init(named: "436ccfc7d93b46fd3a2d571275eb051b")
		image = image?.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: left, bottom: 0, right: 10), resizingMode: .stretch)
		button.setBackgroundImage(image, for: .normal)
		button.titleLabel?.font = UIFont.italicSystemFont(ofSize: 10)
		button.setTitleColor(UIColor.init(red: 123 / 255.0, green: 123 / 255.0, blue: 123 / 255.0, alpha: 1), for: .normal)
		button.setTitle("5", for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 2, left: left, bottom: 2, right: 8)
		return button
	}()
	
	lazy var signButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		button.setTitleColor(UIColor.init(red: 0.71, green: 0.18, blue: 0.17, alpha: 1), for: .normal)
		button.setTitle("签到", for: .normal)
		let image = UIImage.init(named: "c708f42801f8a8cd2a4e351c2decb44c")
		button.setImage(image, for: .normal)
		button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 8, bottom: 5, right: 8)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 5)
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.init(red: 0.71, green: 0.18, blue: 0.17, alpha: 1).cgColor
		button.layer.masksToBounds = true
		return button
	}()
	
	lazy var separatorLine: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05)
		return view
	}()
	
	lazy var collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout.init()
		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
		collectionView.backgroundColor = UIColor.clear
		collectionView.isScrollEnabled = false
		return collectionView
	}()
	
	override func layoutSubviews() {
		super.layoutSubviews()
		headImageView.layer.cornerRadius = headImageView.bounds.size.height / 2.0
		signButton.layer.cornerRadius = signButton.bounds.size.height / 2.0
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		backgroundColor = UIColor.clear
		selectionStyle = .none
		
		contentView.addSubview(userContentView)		
		contentView.addSubview(separatorLine)
		contentView.addSubview(collectionView)

		addSubview(headImageView)
		userContentView.addSubview(titleLabel)
		userContentView.addSubview(levelButton)
		addSubview(signButton)
		
		userContentView.snp.makeConstraints { (maker) in
			maker.left.right.top.equalTo(0)
			maker.bottom.equalTo(separatorLine.snp.top)
		}
		separatorLine.snp.makeConstraints { (maker) in
			maker.left.right.equalTo(0)
			maker.height.equalTo(1 / UIScreen.main.scale)
			maker.bottom.equalTo(collectionView.snp.top)
		}
		collectionView.snp.makeConstraints { (maker) in
			maker.left.right.bottom.equalTo(0)
			maker.height.equalTo(50)
		}
		
		headImageView.snp.makeConstraints { (maker) in
			maker.centerY.equalTo(userContentView)
			maker.left.equalTo(15)
			maker.width.height.equalTo(60)
		}
		titleLabel.snp.makeConstraints { (maker) in
			maker.left.equalTo(headImageView.snp.right).offset(8)
			maker.top.equalTo(headImageView).offset(10)
		}
		levelButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(titleLabel)
			maker.top.equalTo(titleLabel.snp.bottom).offset(10)
		}
		signButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.centerY.equalTo(userContentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setModel(_ model: Any?, for indexPath: IndexPath) {
		guard let model = model as? HTAccountUserModel else {
			return
		}
		collectionView.setCellModelArray(model.countModelArray, proxy: self)
		collectionView.reloadData()
	}
	
}

extension HTAccountUserCell: CollectionViewThrough, UICollectionViewDelegateFlowLayout {
	
	func cellClass<T>(_ reuseView: T, for indexPath: IndexPath) -> ReuseCell.Type where T : ReuseAbleView {
		return HTAccountUserCountCell.self
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return reuseViewNumberOfSections(in: collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return reuseView(collectionView, numberOfRowsInSection: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return reuseView(collectionView, cellForRowAt: indexPath) as! UICollectionViewCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.bounds.size.width / CGFloat(collectionView.cellModelArray().count)
		return CGSize.init(width: width, height: collectionView.bounds.size.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets.zero
	}
	
}
