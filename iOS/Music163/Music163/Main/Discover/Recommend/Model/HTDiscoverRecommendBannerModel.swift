//
//  HTDiscoverRecommendBannerModel.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendBannerType {
	case `default`
}

class HTDiscoverRecommendBannerModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendBannerType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTDiscoverRecommendBannerModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "数字专辑", controllerClassKey: UIViewController.self, imageKey: "89febaaa5582084ca21e191409584c48", selectedImageKey: "1b7382684d797b6b40244ed030ce0672", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "数字专辑", controllerClassKey: UIViewController.self, imageKey: "62f8b49b1d7ee366727958997ccc9eed", selectedImageKey: "1b7382684d797b6b40244ed030ce0672", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "活动", controllerClassKey: UIViewController.self, imageKey: "299ab09a7bcbbe858cb7307b043f5926", selectedImageKey: "1b7382684d797b6b40244ed030ce0672", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "广告", controllerClassKey: UIViewController.self, imageKey: "ea826bd92ec37a58868d2ec5473b2c1a", selectedImageKey: "1b7382684d797b6b40244ed030ce0672", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "独家", controllerClassKey: UIViewController.self, imageKey: "9495570623da125ecf71db9b07bccd27", selectedImageKey: "795e8c9fe9d0284e836b95cfb2530465", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "独家策划", controllerClassKey: UIViewController.self, imageKey: "45e71164ac4bd40115fa7c9eaca919eb", selectedImageKey: "1b7382684d797b6b40244ed030ce0672", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "独家", controllerClassKey: UIViewController.self, imageKey: "65163b6c9a5f40132111493ecf841b7f", selectedImageKey: "795e8c9fe9d0284e836b95cfb2530465", selectedKey: false],
			[titleKey: "", typeKey: HTDiscoverRecommendBannerType.default, textKey: "商城", controllerClassKey: UIViewController.self, imageKey: "f737ccfa7c225c6d53a1452b2b640949", selectedImageKey: "1b7382684d797b6b40244ed030ce0672", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendBannerModel in
			let model = HTDiscoverRecommendBannerModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendBannerType
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
