//
//  HTMineRecommondModel.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTMineRecommendType {
	case `default`
}

class HTMineRecommendModel: NSObject {
	
	var title: String?
	var type: HTMineRecommendType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTMineRecommendModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "云音乐热歌榜", typeKey: HTMineRecommendType.default, textKey: "28.3亿", controllerClassKey: UIViewController.self, imageKey: "69c6c56db9b4604543abcb8caa30c57c", selectedImageKey: "", selectedKey: false],
			[titleKey: "\"若是心怀旧梦 就别再无疾而终\"", typeKey: HTMineRecommendType.default, textKey: "622万", controllerClassKey: UIViewController.self, imageKey: "b88cf217107758094260434a81544663", selectedImageKey: "", selectedKey: false],
			[titleKey: "那些喜欢刀循环播放的歌", typeKey: HTMineRecommendType.default, textKey: "1116万", controllerClassKey: UIViewController.self, imageKey: "c91063c0a1746e5ba6958ee6af620e91", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineRecommendModel in
			let model = HTMineRecommendModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineRecommendType
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
