//
//  HTCircleRecommendModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCircleRecommendType {
	case `default`
}

class HTCircleRecommendModel: NSObject {
	
	var title: String?
	var type: HTCircleRecommendType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var flagTitle: String?
	var dateTitle: String?
	
	class func packModelArray() -> [HTCircleRecommendModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let flagTitleKey = "flagTitleKey"
		let dateTitleKey = "dateTitleKey"
		let keyValueArray = [
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
			[titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
            [titleKey: "德芙\"一份甜蜜送老师\"", typeKey: HTCircleRecommendType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "79296afb6d672a6831c91ce9053eadd0", selectedImageKey: "", selectedKey: false, flagTitleKey: "免费试吃互动游戏", dateTitleKey: "11月10日-12月2日"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCircleRecommendModel in
			let model = HTCircleRecommendModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCircleRecommendType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.flagTitle = dictionary[flagTitleKey] as? String
			model.dateTitle = dictionary[dateTitleKey] as? String
			return model
		}
		return modelArray
	}
}
