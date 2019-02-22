//
//  HTMusicPlayerNavigaionBar.swift
//  Music163
//
//  Created by hublot on 2018/12/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

class HTMusicPlayerNavigaionBar: UIView {
	
	lazy var navigationContentView: UIView = {
		let view = UIView.init(frame: CGRect.zero)
		return view
	}()
	
	lazy var backBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "c74497afdc4af209dd77acc1ece997c3")
		button.setImage(image, for: .normal)
		return button
	}()
	
	lazy var titleBarButton: HTMusicPlayerTitlteBarItem = {
		let button = HTMusicPlayerTitlteBarItem.init(frame: CGRect.zero)
		return button
	}()
	
	lazy var imageBarButton: HTMusicPlayerImageBarItem = {
		let button = HTMusicPlayerImageBarItem.init(frame: CGRect.zero)
		return button
	}()
	
	lazy var shareBarButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		button.setImage(UIImage.init(named: "737182b8d87f0b415cffb6f2c4c447fc"), for: .normal)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(navigationContentView)
		navigationContentView.addSubview(backBarButton)
		navigationContentView.addSubview(titleBarButton)
		navigationContentView.addSubview(imageBarButton)
		navigationContentView.addSubview(shareBarButton)
		navigationContentView.snp.makeConstraints { (maker) in
			maker.edges.equalTo(UIEdgeInsets.init(top: HTStatic.statusHeight, left: 0, bottom: 0, right: 0))
		}
		backBarButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(13)
			maker.centerY.equalTo(navigationContentView)
		}
		titleBarButton.snp.makeConstraints { (maker) in
			maker.left.equalTo(backBarButton.snp.right).offset(10)
			maker.top.bottom.equalTo(navigationContentView)
		}
		imageBarButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(shareBarButton.snp.left).offset(-16)
			maker.centerY.equalTo(navigationContentView)
		}
		shareBarButton.snp.makeConstraints { (maker) in
			maker.right.equalTo(-10)
			maker.centerY.equalTo(navigationContentView)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
