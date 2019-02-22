//
//  HTIndexLimitModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexLimitType {
	case time
	case better
}

class HTIndexLimitModel: NSObject {
	
	var title: String?
	var type: HTIndexLimitType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var time: TimeInterval?
	var leftImage: String?
	var leftTitle: String?
	var rightImage: String?
	var rightTitle: String?	
	
	class func packModelArray() -> [HTIndexLimitModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let timeKey = "tiemKey"
		let leftImageKey = "leftImageKey"
		let leftTitleKey = "leftTitleKey"
		let rightImageKey = "rightImageKey"
		let rightTitleKey = "rightTitleKey"
		let keyValueArray = [
			[titleKey: "限时抢购", typeKey: HTIndexLimitType.time, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, timeKey: nil, leftImageKey: "b343259fcc9f3168da3eb9b2ffd3ba73", leftTitleKey: "爆款直降", rightImageKey: "7fbca165fe4e4e288ac924206d666fd9", rightTitleKey: "限时特价"],
			[titleKey: "天猫好物", typeKey: HTIndexLimitType.better, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, timeKey: nil, leftImageKey: "eb041e319ce24620f341c4e773a97376", leftTitleKey: "穿出高级感", rightImageKey: "1ac8c344d48c83c65b9a45dca9317d76", rightTitleKey: "穿出高级感"]
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexLimitModel in
			let model = HTIndexLimitModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexLimitType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			
			model.time = dictionary[timeKey] as? TimeInterval
			model.leftImage = dictionary[leftImageKey] as? String
			model.leftTitle = dictionary[leftTitleKey] as? String
			model.rightImage = dictionary[rightImageKey] as? String
			model.rightTitle = dictionary[rightTitleKey] as? String
			return model
		}
		return modelArray
	}
}
