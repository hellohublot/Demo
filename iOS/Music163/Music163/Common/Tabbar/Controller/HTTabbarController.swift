//
//  HTTabbarController.swift
//  Tian
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTTabbarController: UITabBarController {

	let modelArray = HTTabbarModel.packModelArray()
	
	lazy var blurEffectView: UIVisualEffectView = {
		let blueEffectView = UIVisualEffectView.init(frame: CGRect.zero)
		blueEffectView.effect = UIBlurEffect.init(style: UIBlurEffectStyle.dark)
		return blueEffectView
	}()
		
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		
	}
	
	func initInterface() {
		
		let tabbar = HTTabBar()
		setValue(tabbar, forKey: NSStringFromSelector(#selector(getter: tabBar)))
		
		tabBar.barStyle = .black
		tabBar.isTranslucent = true
		let imageView = UIImageView.init(frame: CGRect.zero)
		imageView.image = UIImage.init(named: "771e6a6e24f892f27f2733cb02ea00ae")
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		tabBar.insertSubview(imageView, at: 0)
		imageView.snp.makeConstraints { (maker) in
			maker.top.equalTo(-0.5)
			maker.height.equalTo(1 / UIScreen.main.scale)
			maker.left.right.equalTo(0)
		}
		
		for model in modelArray {
			let controller = model.controllerClass?.init() ?? UIViewController()
			let navigationController = HTNavigationController.init(rootViewController: controller)
			addChildViewController(navigationController)
			let font = UIFont.systemFont(ofSize: 10)
			controller.tabBarItem.setTitleTextAttributes([
				.font: font,
				.foregroundColor: UIColor.init(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
			], for: .normal)
			controller.tabBarItem.setTitleTextAttributes([
				.font: font,
				.foregroundColor: UIColor.init(red: 0.71, green: 0.18, blue: 0.17, alpha: 1)
			], for: .selected)
			controller.tabBarItem.title = model.title
			controller.tabBarItem.image = UIImage.init(named: model.image ?? "")?.withRenderingMode(.alwaysOriginal)
			controller.tabBarItem.selectedImage = UIImage.init(named: model.selectedImage ?? "")?.withRenderingMode(.alwaysOriginal)
		}
		
		view.addSubview(type(of: self).playerButton)
		type(of: self).playerButton.whenTouch(inside: { [weak self] (_, _) in
			guard let navigationController = self?.selectedViewController as? UINavigationController else {
				return
			}
			navigationController.pushViewController(HTMusicPlayerController.share, animated: true)
		}, receive: nil)
		type(of: self).playerButton.snp.makeConstraints { (maker) in
			maker.top.equalTo(HTStatic.statusHeight)
			maker.right.equalTo(0)
			maker.width.equalTo(type(of: self).playContentWidth)
			maker.height.equalTo(43)
		}
		
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		let imageView = tabBar.subviews.first?.subviews.first as? UIImageView
		imageView?.isHidden = true
	}

}

extension HTTabbarController {
	
	static let playContentWidth: CGFloat = 48
	
	static func createPlayButtonPlaceholderBarButtonItem() -> UIBarButtonItem {
		let view = UIView.init(frame: CGRect.zero)
		view.bounds = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: playContentWidth, height: playContentWidth))
		let barButtonItem = UIBarButtonItem.init(customView: view)
		return barButtonItem
	}
	
	static var playerButton: UIButton = {
		let button = UIButton.init(frame: CGRect.zero)
		let image = UIImage.init(named: "9859deae6d8bb792658d587b1979b876")
		button.setImage(image, for: .normal)
		return button
	}()
	
}
