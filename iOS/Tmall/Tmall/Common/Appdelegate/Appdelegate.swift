//
//  Appdelegate.swift
//  Tmall
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import SnapKit
import HTButton

@UIApplicationMain
class Appdelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		window = UIWindow.init(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.backgroundColor = .white
		window?.rootViewController = HTTabbarController()
		
		application.setStatusBarHidden(false, with: .none)
		
		DispatchQueue.global().async {
			self.registerFramework(launchOptions)
		}
		return true
	}
	
}
