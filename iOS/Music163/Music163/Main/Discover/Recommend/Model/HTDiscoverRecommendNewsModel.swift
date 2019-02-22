//
//  HTDiscoverRecommendNewsModel.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendNewsType {
	case `default`
}

class HTDiscoverRecommendNewsModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendNewsType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTDiscoverRecommendNewsModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "推荐合口味的新歌", typeKey: HTDiscoverRecommendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "f17265531ffb1f89fff67e8b0b9d56b5", selectedImageKey: "4aa952fd50da7bb89eb9c7d66b796de1", selectedKey: false],
			[titleKey: "鸣", typeKey: HTDiscoverRecommendNewsType.default, textKey: "宫阁", controllerClassKey: UIViewController.self, imageKey: "a908e18d140be5e886df85aef716de07", selectedImageKey: "", selectedKey: false],
			[titleKey: "million dollar", typeKey: HTDiscoverRecommendNewsType.default, textKey: "Mc光光", controllerClassKey: UIViewController.self, imageKey: "c7df7490dc030fc5f4ff68eca31f8713", selectedImageKey: "", selectedKey: false],
			[titleKey: "L.O.V.E.＝陈奕迅", typeKey: HTDiscoverRecommendNewsType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "2cdefd4ecf82326833fde0db9b6e4f5e", selectedImageKey: "56c5392f98b138a88b0aed94424832b9", selectedKey: false],
			[titleKey: "岩石里的花", typeKey: HTDiscoverRecommendNewsType.default, textKey: "G.E.M.邓紫棋", controllerClassKey: UIViewController.self, imageKey: "b89896292d258e89a7d5b9e017da9061", selectedImageKey: "", selectedKey: false],
			[titleKey: "唱首歌", typeKey: HTDiscoverRecommendNewsType.default, textKey: "南征北战NZBZ", controllerClassKey: UIViewController.self, imageKey: "f5e14fcf7f7d81d453472e0ac4ae9af9", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendNewsModel in
			let model = HTDiscoverRecommendNewsModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendNewsType
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
