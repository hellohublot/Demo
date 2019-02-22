//
//  HTMineImageModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/28.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineImageType {
	case `default`
}

class HTMineImageModel: NSObject {
	
	var title: String?
	var type: HTMineImageType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray(_ sectionType: HTMineSectionType?) -> [HTMineImageModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		var keyValueArray = [[String: Any]]()
		switch sectionType {
		case .packet?:
			keyValueArray.append(contentsOf: [
				[titleKey: "", typeKey: HTMineImageType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "50ee0afe286597737970fc68e3734758", selectedImageKey: "", selectedKey: false],
			])
		case .point?:
            keyValueArray.append(contentsOf: [
                [titleKey: "", typeKey: HTMineImageType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "7f1b16bde3812dfb3e69dfdb1fd3e9bc", selectedImageKey: "", selectedKey: false],
            ])
		case .gift?:
			keyValueArray.append(contentsOf: [
				[titleKey: "", typeKey: HTMineImageType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b87c74b2e9392b8ab6792dd465fac68a", selectedImageKey: "", selectedKey: false],
			])
		case .card?:
            keyValueArray.append(contentsOf: [
                [titleKey: "", typeKey: HTMineImageType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "f5e28442ea073ee0bb5308143a8e5fa3", selectedImageKey: "", selectedKey: false],
            ])
		default:
			break
		}
		let modelArray = keyValueArray.map { dictionary -> HTMineImageModel in
			let model = HTMineImageModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineImageType
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
