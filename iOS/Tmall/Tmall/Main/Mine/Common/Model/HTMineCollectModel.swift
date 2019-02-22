//
//  HTMineStoreModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineCollectType {
	case `default`
}

class HTMineCollectModel: NSObject {
	
	var title: String?
	var type: HTMineCollectType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTMineCollectModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "0", typeKey: HTMineCollectType.default, textKey: "商品收藏", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "8", typeKey: HTMineCollectType.default, textKey: "店铺收藏", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "0", typeKey: HTMineCollectType.default, textKey: "内容收藏", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "98", typeKey: HTMineCollectType.default, textKey: "足迹", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineCollectModel in
			let model = HTMineCollectModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineCollectType
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
