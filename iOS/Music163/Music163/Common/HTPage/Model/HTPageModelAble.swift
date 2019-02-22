//
//  PageModel.swift
//  Music163
//
//  Created by hublot on 2018/12/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

protocol HTPageModelAble {
	
	var title: String? { get }
	
	var controllerClass: UIViewController.Type? { get }
	
	var controller: UIViewController? { set get }
	
	var selected: Bool? { set get }
	
}
