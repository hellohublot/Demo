//
//  HTIndexGoodModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/26.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexGoodType {
	case `default`
}

class HTIndexGoodModel: NSObject {
	
	var title: String?
	var type: HTIndexGoodType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var price: String?
	var storeImage: String?
	var storeTitle: String?
    
    var height: CGFloat?
	
	class func packModelArray() -> [HTIndexGoodModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let priceKey = "priceKey"
		let storeImageKey = "storeImageKey"
		let storeTitleKey = "storeTitleKey"
		let keyValueArray = [
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
			[titleKey: "皇家10kg室内猫咪主粮去毛球猫食", typeKey: HTIndexGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "24fbcd3feeb500e8e55a8f652804d503", selectedImageKey: "", selectedKey: false, priceKey: "¥504", storeImageKey: "c4b98e7a97b9f29ca3985f7c0d59cc88", storeTitleKey: "ROYAL CANIIN/皇家"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexGoodModel in
			let model = HTIndexGoodModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexGoodType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.price = dictionary[priceKey] as? String
			model.storeImage = dictionary[storeImageKey] as? String
			model.storeTitle = dictionary[storeTitleKey] as? String
            model.height = CGFloat(arc4random() % 150 + 200)
			return model
		}
		return modelArray
	}
}
