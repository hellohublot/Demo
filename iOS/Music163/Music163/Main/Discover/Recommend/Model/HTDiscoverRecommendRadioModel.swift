//
//  HTDiscoverRecommendRadioModel.swift
//  Music163
//
//  Created by hublot on 2018/12/14.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendRadioType {
	case `default`
}

class HTDiscoverRecommendRadioModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendRadioType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var flagTitle: String?
	
	class func packModelArray() -> [HTDiscoverRecommendRadioModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let flagTitleKey = "flagTitleKey"
		
		let keyValueArray = [
			[titleKey: "清澈嗓音让人沉醉", typeKey: HTDiscoverRecommendRadioType.default, textKey: "陈小黄", controllerClassKey: UIViewController.self, imageKey: "899ad2a1b67858d5d4f71846f03509c3", selectedImageKey: "", selectedKey: false, flagTitleKey: ""],
			[titleKey: "最通俗易懂的爵士乐入门宝典", typeKey: HTDiscoverRecommendRadioType.default, textKey: "听得懂的爵士乐", controllerClassKey: UIViewController.self, imageKey: "29e780310aeb647ce1b00aa9ed449f15", selectedImageKey: "", selectedKey: false, flagTitleKey: "付费精品"],
			[titleKey: "1分钟很长，长到可以记一辈子", typeKey: HTDiscoverRecommendRadioType.default, textKey: "60's 这一分钟", controllerClassKey: UIViewController.self, imageKey: "01758f92bb18049d933cc3354ea06e86", selectedImageKey: "", selectedKey: false, flagTitleKey: ""],
			[titleKey: "在他的歌里，听见繁华的烟火人间", typeKey: HTDiscoverRecommendRadioType.default, textKey: "狗子你变了en", controllerClassKey: UIViewController.self, imageKey: "6b04bc0e8f1ed855c7b97318806f9f8a", selectedImageKey: "", selectedKey: false, flagTitleKey: ""],
			[titleKey: "爱听歌的你，不能错过他", typeKey: HTDiscoverRecommendRadioType.default, textKey: "朱平同学", controllerClassKey: UIViewController.self, imageKey: "198a6d1553b107221a352310e30a04d3", selectedImageKey: "", selectedKey: false, flagTitleKey: ""],
			[titleKey: "请记住我叫小攀哟", typeKey: HTDiscoverRecommendRadioType.default, textKey: "天亮以前说再见曲艳娇", controllerClassKey: UIViewController.self, imageKey: "db5e87e9f2f97a1a03bd70fd4fc574c2", selectedImageKey: "", selectedKey: false, flagTitleKey: ""],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendRadioModel in
			let model = HTDiscoverRecommendRadioModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendRadioType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.flagTitle = dictionary[flagTitleKey] as? String
			return model
		}
		return modelArray
	}
}
