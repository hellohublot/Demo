//
//  HTAccountCountModel.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTAccountCountTyep {
	case new
	case follow
	case fans
	case info
}

enum HTAccountCountDisplayType {
	case title
	case image
}

class HTAccountCountModel: NSObject {
	
	var title: String?
	var type: HTAccountCountTyep?
	var displayType: HTAccountCountDisplayType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTAccountCountModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let displayTypeKey = "displayTypeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "动态", typeKey: HTAccountCountTyep.new, displayTypeKey: HTAccountCountDisplayType.title, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "关注", typeKey: HTAccountCountTyep.follow, displayTypeKey: HTAccountCountDisplayType.title, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "粉丝", typeKey: HTAccountCountTyep.fans, displayTypeKey: HTAccountCountDisplayType.title, textKey: "0", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "我的资料", typeKey: HTAccountCountTyep.info, displayTypeKey: HTAccountCountDisplayType.image, textKey: "", controllerClassKey: UIViewController.self, imageKey: "a1e58a52fc5e4d54cf8b3bbf6cc88636", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTAccountCountModel in
			let model = HTAccountCountModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTAccountCountTyep
			model.displayType = dictionary[displayTypeKey] as? HTAccountCountDisplayType
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
