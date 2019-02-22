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
		transferNavigationBarAttributes = true
	}
	
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		viewController.hidesBottomBarWhenPushed = childViewControllers.count > 0
		super.pushViewController(viewController, animated: true)
		if childViewControllers.count > 1 {
			viewController.navigationController?.view.backgroundColor = .white
		} else {
			viewController.view.backgroundColor = .white
		}
	}
	
	/*-------------------------------------/ controller override /-----------------------------------*/

}
