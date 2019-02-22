//
//  HTMineOrderModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineOrderType {
	case `default`
}

class HTMineOrderModel: NSObject {
	
	var title: String?
	var type: HTMineOrderType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTMineOrderModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "待付款", typeKey: HTMineOrderType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "27dc7dd28798ab00b887ec72d50d9f3f", selectedImageKey: "", selectedKey: false],
			[titleKey: "待发货", typeKey: HTMineOrderType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "6ed7fffa9152ebdc23812c830950469d", selectedImageKey: "", selectedKey: false],
			[titleKey: "待收货", typeKey: HTMineOrderType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "ff47a0080aebb64d49ecbcd16f6fbfec", selectedImageKey: "", selectedKey: false],
			[titleKey: "待评价", typeKey: HTMineOrderType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "8eb3f36422047b8e528337e9f5bd3516", selectedImageKey: "", selectedKey: false],
			[titleKey: "退款/售后", typeKey: HTMineOrderType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e928668ffa6c2ab4c2d089ebea49a5e0", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineOrderModel in
			let model = HTMineOrderModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineOrderType
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
