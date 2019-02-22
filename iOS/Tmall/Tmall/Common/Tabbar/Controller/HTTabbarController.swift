//
//  HTTabbarController.swift
//  Tmall
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

class HTTabbarController: UITabBarController {

	let modelArray = HTTabbarModel.packModelArray()
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		
	}
	
	func initInterface() {
		
		tabBar.isTranslucent = false
				
		for model in modelArray {
			let controller = model.controllerClass?.init() ?? UIViewController()
			let navigationController = HTNavigationController.init(rootViewController: controller)
			addChildViewController(navigationController)
			let font = UIFont.systemFont(ofSize: 10)
			controller.tabBarItem.setTitleTextAttributes([
				.font: font,
				.foregroundColor: UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
			], for: .normal)
			controller.tabBarItem.setTitleTextAttributes([
				.font: font,
				.foregroundColor: UIColor.init(red: 1, green: 0, blue: 0.21, alpha: 1)
			], for: .selected)
			controller.tabBarItem.title = model.title
			controller.tabBarItem.image = UIImage.init(named: model.image ?? "")?.withRenderingMode(.alwaysOriginal)
			controller.tabBarItem.selectedImage = UIImage.init(named: model.selectedImage ?? "")?.withRenderingMode(.alwaysOriginal)
		}

	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	

}
