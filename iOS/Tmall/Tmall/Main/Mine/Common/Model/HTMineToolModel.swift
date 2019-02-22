//
//  HTMineToolModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineToolType {
	case `default`
}

class HTMineToolModel: NSObject {
	
	var title: String?
	var type: HTMineToolType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTMineToolModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "下单有礼", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "5b187649e4ee8f343c29e42a33e9f9a1", selectedImageKey: "", selectedKey: false],
			[titleKey: "会员中心", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "3b327db763be641709bbaecb94e69e4a", selectedImageKey: "", selectedKey: false],
			[titleKey: "免费试用", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "a77131f5e6a65630a3c77edd103df7b4", selectedImageKey: "", selectedKey: false],
			[titleKey: "话费充值", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "cdde317845deb4d22abc3946d0fd3e11", selectedImageKey: "", selectedKey: false],
			[titleKey: "领劵中心", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "6e00311795f94b40f3acabff9985022e", selectedImageKey: "", selectedKey: false],
			[titleKey: "机票火车票", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "6cb1e625043589ef1f54c9262d7e39aa", selectedImageKey: "", selectedKey: false],
			[titleKey: "会员积分", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "262ca00f4c89b130b6b8c3f7ce61e0db", selectedImageKey: "", selectedKey: false],
			[titleKey: "三单有礼", typeKey: HTMineToolType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "323f62158450a5d6f2e792270879859a", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineToolModel in
			let model = HTMineToolModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineToolType
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
