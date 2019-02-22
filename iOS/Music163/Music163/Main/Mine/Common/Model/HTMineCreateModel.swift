//
//  HTMineCreateModel.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineCreateType {
	case `default`
}

class HTMineCreateModel: NSObject {
	
	var title: String?
	var type: HTMineCreateType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTMineCreateModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "我喜欢的音乐", typeKey: HTMineCreateType.default, textKey: "2首", controllerClassKey: UIViewController.self, imageKey: "3e43a2e67829ae4c466b28011d4136a0", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineCreateModel in
			let model = HTMineCreateModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineCreateType
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
