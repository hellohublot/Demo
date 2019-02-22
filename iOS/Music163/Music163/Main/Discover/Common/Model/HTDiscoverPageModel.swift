//
//  HTDiscoverNavigationPageModel.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverPageType {
	case `default`
}

class HTDiscoverPageModel: NSObject, HTPageModelAble {
	
	var title: String?
	var type: HTDiscoverPageType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var controller: UIViewController?
	
	class func packModelArray() -> [HTDiscoverPageModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "个性推荐", typeKey: HTDiscoverPageType.default, textKey: "", controllerClassKey: HTDiscoverRecommendController.self, imageKey: "", selectedImageKey: "", selectedKey: true],
            [titleKey: "主播电台", typeKey: HTDiscoverPageType.default, textKey: "", controllerClassKey: HTDiscoverRadioController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverPageModel in
			let model = HTDiscoverPageModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverPageType
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
