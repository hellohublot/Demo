//
//  HTNavigationController.swift
//  Tian
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import RTRootNavigationController

class HTNavigationController: RTRootNavigationController {
	
	/*-------------------------------------/ init /-----------------------------------*/
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		
	}
	
	func initInterface() {
		navigationBar.shadowImage = UIImage.from(UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.01))
		navigationBar.titleTextAttributes = [
			.font: UIFont.systemFont(ofSize: 18),
			.foregroundColor: UIColor.init(white: 1, alpha: 0.8)
		]
		navigationBar.barStyle = .black
		navigationBar.isTranslucent = true
		transferNavigationBarAttributes = true
	}
	
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		viewController.hidesBottomBarWhenPushed = childViewControllers.count > 0
		super.pushViewController(viewController, animated: true)
		
		let backgroundColor = UIColor.init(red: 0.14, green: 0.13, blue: 0.15, alpha: 1)
		if childViewControllers.count > 1 {
			viewController.navigationController?.view.backgroundColor = backgroundColor
		} else {
			viewController.view.backgroundColor = backgroundColor
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/

}
