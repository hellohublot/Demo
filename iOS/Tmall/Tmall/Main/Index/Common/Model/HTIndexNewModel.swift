//
//  HTIndexBlackModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/26.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexNewType {
	case black
	case tryuse
}

class HTIndexNewModel: NSObject {
	
	var title: String?
	var detail: String?
	var type: HTIndexNewType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var leftImage: String?
	var leftTitle: String?
	var rightImage: String?
	var rightTitle: String?
	
	class func packModelArray() -> [HTIndexNewModel] {
		let titleKey = "titleKey"
		let detailKey = "detailKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let leftImageKey = "leftImageKey"
		let leftTitleKey = "leftTitleKey"
		let rightImageKey = "rightImageKey"
		let rightTitleKey = "rightTitleKey"

		
		let keyValueArray = [
			[titleKey: "小黑盒新品", detailKey: "新品好物", typeKey: HTIndexNewType.black, textKey: "领劵试用", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, leftImageKey: "fdfee4d644e4f61a9f487fca10f67535", leftTitleKey: "新品驾到", rightImageKey: "5a857ee92350d3ff60f9fef5c1b84226", rightTitleKey: "新品驾到"],
			[titleKey: "U先试用", detailKey: "新品优先试", typeKey: HTIndexNewType.tryuse, textKey: "大牌低价领", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, leftImageKey: "7f7fce9fd53f5562cf70bb3e316a6f69", leftTitleKey: "仙潭特曲品鉴小酒", rightImageKey: "", rightTitleKey: ""],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexNewModel in
			let model = HTIndexNewModel()
			model.title = dictionary[titleKey] as? String
			model.detail = dictionary[detailKey] as? String
			model.type = dictionary[typeKey] as? HTIndexNewType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.leftImage = dictionary[leftImageKey] as? String
			model.leftTitle = dictionary[leftTitleKey] as? String
			model.rightImage = dictionary[rightImageKey] as? String
			model.rightTitle = dictionary[rightTitleKey] as? String
			return model
		}
		return modelArray
	}
}
