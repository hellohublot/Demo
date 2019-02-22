//
//  HTAccountUserModel.swift
//  Music163
//
//  Created by hublot on 2018/12/10.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTAccountUserType {
	case `default`
}

class HTAccountUserModel: NSObject {
	
	var title: String?
	var type: HTAccountUserType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	let countModelArray = HTAccountCountModel.packModelArray()
	
	class func packModelArray() -> [HTAccountUserModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTAccountUserType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTAccountUserModel in
			let model = HTAccountUserModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTAccountUserType
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
