//
//  HTIndexCheapModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexCheapType {
	case `default`
}

class HTIndexCheapModel: NSObject {
	
	var title: String?
	var type: HTIndexCheapType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTIndexCheapModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "满144元减10", typeKey: HTIndexCheapType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "743096199e783e5efa2dd775aa8f591f", selectedImageKey: "", selectedKey: false],
			[titleKey: "满58元减5", typeKey: HTIndexCheapType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00953a10cc339a150c916c7121af9cbd", selectedImageKey: "", selectedKey: false],
			[titleKey: "满99元减3", typeKey: HTIndexCheapType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "7b750fe98b6c5c88989bf0ceace77255", selectedImageKey: "", selectedKey: false],
			[titleKey: "20点抢神劵", typeKey: HTIndexCheapType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "00ef9b3b1b24dea1f083dd69ddf67109", selectedImageKey: "", selectedKey: false]
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexCheapModel in
			let model = HTIndexCheapModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexCheapType
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
