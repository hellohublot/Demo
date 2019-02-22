//
//  HTCircleActivityModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCircleActivityType {
	case `default`
}

class HTCircleActivityModel: NSObject {
	
	var title: String?
	var type: HTCircleActivityType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTCircleActivityModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "0fd613e47749f6acdfab4a44eb003aef", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "2fd86fb8c225c18dc1a7af2573fe9910", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "706620a52c94ac6aa895a5631b74ef88", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "37647408a8ef79b276751da752311763", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "a1a6e58f33fd4bd1074c9d63b85dc7ab", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "bba265888bd989408acf587eab39612d", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cb610ee2041dcf32bc39917f6233556b", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "df06f34680c0e9dde0f403e4b233a325", selectedImageKey: "", selectedKey: false],
			[titleKey: "", typeKey: HTCircleActivityType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "f2967cdbd6595a8dd0d287beb4076c9c", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCircleActivityModel in
			let model = HTCircleActivityModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCircleActivityType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			return model
		}
		return modelArray
	}
}
