//
//  HTExerciseNavigationBar.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTExerciseNavigationBar: UIView {
	
	static let navigationHeight = HTStatic.navigationHeight + 26

	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.layer.masksToBounds = true
		imageView.contentMode = .scaleAspectFill
		imageView.image = UIImage.init(named: "4608c544d5e84a31a989e18cc74d54d7")
		return imageView
	}()
	
	lazy var contentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var headImageView: UIImageView = {
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.masksToBounds = true
		let image = UIImage.init(named: "41e21da5ca5e690e7dc6710e386da97e")
		imageView.image = image
		return imageView
	}()
	
	lazy var leftCircleView: HTMineUserCircleView = {
		let circleView = HTMineUserCircleView.init(frame: CGRect.zero)
		return circleView
	}()
	
	lazy var rightCircleView: HTMineUserCircleView = {
		let circleView = HTMineUserCircleView.init(frame: CGRect.zero)
		return circleView
	}()
	
	lazy var refreshButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
		button.setTitleColor(UIColor.init(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), for: .normal)
		let image = UIImage.init(named: "e8eb7ae38cb0506a38df0ce83d651027")
		button.setImage(image, for: .normal)
		button.setTitle("同步", for: .normal)
		button.ht_makeEdge(with: .horizontal, imageToTitleaOffset: 8)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(backgroundImageView)
		addSubview(contentView)
		addSubview(headImageView)
		addSubview(leftCircleView)
		addSubview(rightCircleView)
		addSubview(refreshButton)
		let circleModelArray = HTMineUserCircleModel.packModelArray()
		leftCircleView.setModel(circleModelArray.first, for: IndexPath())
		rightCircleView.setModel(circleModelArray.last, for: IndexPath())
		backgroundImageView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.zero)
		}
		contentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
		}
		headImageView.snp.makeConstraints { (maker) in
			maker.left.equalTo(15)
			maker.height.equalTo(40)
			maker.centerY.equalTo(contentView)
		}
		leftCircleView.snp.makeConstraints { (maker) in
			maker.left.equalTo(headImageView.snp.right).offset(10)
			maker.centerY.equalTo(contentView)
			maker.width.equalTo(50)
			maker.height.equalTo(30)
		}
		rightCircleView.snp.makeConstraints { (maker) in
			maker.left.equalTo(leftCircleView.snp.right).offset(5)
			maker.width.height.equalTo(leftCircleView)
			maker.centerY.equalTo(leftCircleView)
		}
		refreshButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-15)
			maker.centerY.equalTo(contentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
