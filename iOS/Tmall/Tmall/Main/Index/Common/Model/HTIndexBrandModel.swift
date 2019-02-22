//
//  HTIndexBrandModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/26.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexBrandType {
	case `default`
}

class HTIndexBrandModel: NSObject {
	
	var title: String?
	var type: HTIndexBrandType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var backgroundImage: String?
	
	class func packModelArray() -> [HTIndexBrandModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let backgroundImageKey = "backgroundImageKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTIndexBrandType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "55085a64ed5328a3e9d4e2310bd767ed", selectedImageKey: "", selectedKey: false, backgroundImageKey: "828edeb06e9150d3ae0d5dc7392baa1a"],
			[titleKey: "", typeKey: HTIndexBrandType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b0bbe2f75729bcfd3e2ca0ae749e7876", selectedImageKey: "", selectedKey: false, backgroundImageKey: "07430591e130cb4de18b9fec5edf4de5"],
			[titleKey: "", typeKey: HTIndexBrandType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b492a073f8420ceefd6be7c4e5868c7b", selectedImageKey: "", selectedKey: false, backgroundImageKey: "0b5fa101a90f1d9f84090c8d020a29b9"],
			[titleKey: "", typeKey: HTIndexBrandType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "ace183aa92f1f0fb8fd195f029ece7f4", selectedImageKey: "", selectedKey: false, backgroundImageKey: "fb7afceba07d45d0c1d9db16ae0c3804"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexBrandModel in
			let model = HTIndexBrandModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexBrandType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.backgroundImage = dictionary[backgroundImageKey] as? String
			return model
		}
		return modelArray
	}
}
