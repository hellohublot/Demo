//
//  ViewController.swift
//  HTSwiftPlaceholder
//
//  Created by hellohublot on 12/20/2017.
//  Copyright (c) 2017 hellohublot. All rights reserved.
//

import UIKit
import HTSwiftPlaceholder

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		initDataSource()
		initInterface()
	}
	
	func initDataSource () {
		
	}
	
	func initInterface() {
		self.view.placeholderProvider = Placeholder.default
		self.view.placeholderState = .firstRefresh
		
	}

}

