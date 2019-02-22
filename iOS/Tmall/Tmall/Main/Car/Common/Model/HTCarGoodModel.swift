//
//  HTCarGoodModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCarGoodType {
	case `default`
}

class HTCarGoodModel: NSObject {
	
	var title: String?
	var type: HTCarGoodType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
    var selectedList: [String]?
	var detail: String?
	var price: String?
	
	class func packModelArray() -> [HTCarGoodModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let detailKey = "detailKey"
		let priceKey = "priceKey"
        let selectedListKey = "selectedListKey"
		let keyValueArray = [
            [titleKey: "Apple/苹果 27 英寸 iMac Retina 5K 显示屏 3.8GHz 处理器 2TB 存储容量", typeKey: HTCarGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "322741d91986e8ace65696e2326e02f3", selectedImageKey: "", selectedKey: true, detailKey: "无需合约版;深空灰色;64GB", priceKey: "¥18131", selectedListKey: ["银色"]],
            [titleKey: "Apple/苹果 15 英寸 MacBook Pro 触控栏和触控 ID 2.6GHz 处理器 512GB 存储容量", typeKey: HTCarGoodType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "53e7a6c4bdf0f9b0bf4015c442f1292a", selectedImageKey: "", selectedKey: false, detailKey: "无需合约版;深空灰色;64GB", priceKey: "¥21988", selectedListKey: ["深空灰色"]],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCarGoodModel in
			let model = HTCarGoodModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCarGoodType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.detail = dictionary[detailKey] as? String
			model.price = dictionary[priceKey] as? String
            model.selectedList = dictionary[selectedListKey] as? [String]
			return model
		}
		return modelArray
	}
}
