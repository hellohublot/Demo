//
//  HTIndexDiscoverModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/23.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexDiscoverType {
	case `default`
}

class HTIndexDiscoverModel: NSObject {
	
	var title: String?
	var type: HTIndexDiscoverType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var backgroundImage: String?
	var tagList: [String]?
	
	class func packModelArray() -> [HTIndexDiscoverModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let backgroundImageKey = "backgroundImageKey"
		let tagListKey = "tagListKey"
		let keyValueArray = [
			[titleKey: "人气\"白斑吗\"回归", typeKey: HTIndexDiscoverType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "4416a8ff26cbf05480c31e90bed7c05c", selectedImageKey: "", selectedKey: false, backgroundImageKey: "34e8d776219fe803d2b1a92401a8b812", tagListKey: ["限量", "潮流尖货"]],
			[titleKey: "SF AF1 MID PRM", typeKey: HTIndexDiscoverType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "5403df2c5b0ef91e10c7297c35573cf0", selectedImageKey: "", selectedKey: false, backgroundImageKey: "bc7130730de1edcf6356296101fbc492", tagListKey: ["限量", "潮流尖货"]],
			[titleKey: "限量夹克全球同步发售", typeKey: HTIndexDiscoverType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "78a76872225692fefca1f45c1b8b5773", selectedImageKey: "", selectedKey: false, backgroundImageKey: "3f8714b58ec8d3cf95de42b42d423f79", tagListKey: ["首发", "潮流尖货"]],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexDiscoverModel in
			let model = HTIndexDiscoverModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexDiscoverType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.backgroundImage = dictionary[backgroundImageKey] as? String
			model.tagList = dictionary[tagListKey] as? [String]
			return model
		}
		return modelArray
	}
}
