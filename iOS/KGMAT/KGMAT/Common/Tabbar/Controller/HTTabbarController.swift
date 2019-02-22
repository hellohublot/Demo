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
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		
	}
	
	func initInterface() {
        
        tabBar.shadowImage = UIImage.from(UIColor.init(red: 219 / 255.0, green: 219 / 255.0, blue: 219 / 255.0, alpha: 1)).imageWith(size: CGSize.init(width: 1, height: 1 / UIScreen.main.scale))
        tabBar.backgroundImage = UIImage.init()
        tabBar.isTranslucent = false
				
		for model in modelArray {
			let controller = model.controllerClass?.init() ?? UIViewController()
			let navigationController = HTNavigationController.init(rootViewController: controller)
			addChildViewController(navigationController)
			let font = UIFont.systemFont(ofSize: 10)
			controller.tabBarItem.setTitleTextAttributes([
				.font: font,
				.foregroundColor: UIColor.init(red: 0.54, green: 0.58, blue: 0.66, alpha: 1)
			], for: .normal)
			controller.tabBarItem.setTitleTextAttributes([
				.font: font,
				.foregroundColor: UIColor.init(red: 0.26, green: 0.51, blue: 0.94, alpha: 1)
			], for: .selected)
			controller.tabBarItem.title = model.title
			controller.tabBarItem.image = UIImage.init(named: model.image ?? "")?.withRenderingMode(.alwaysOriginal)
			controller.tabBarItem.selectedImage = UIImage.init(named: model.selectedImage ?? "")?.withRenderingMode(.alwaysOriginal)
		}

	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/
	
	

}
