//
//  HTDiscoverRecommendVipModel.swift
//  Music163
//
//  Created by hublot on 2018/12/13.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendVipType {
	case `default`
}

class HTDiscoverRecommendVipModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendVipType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var infoType: String?
	var infoTitle: String?
	var infoDetail: String?
	var infoShowPlay: Bool?
	
	class func packModelArray() -> [HTDiscoverRecommendVipModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let infoTypeKey = "infoTypeKey"
		let infoTitleKey = "infoTitleKey"
		let infoDetailKey = "infoDetailKey"
		let infoShowPlayKey = "infoShowPlayKey"
		
		let keyValueArray = [
			[titleKey: "我的爱正慢慢杀死自己", typeKey: HTDiscoverRecommendVipType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "5886ec03f8f7b638894d32c18b645115", selectedImageKey: "ca727c0d6b78db5cc4d6a82553d0e0a6", selectedKey: false, infoTypeKey: "单曲", infoTitleKey: "Silk", infoDetailKey: "Wolf Alice", infoShowPlayKey: true],
			[titleKey: "无论睡在哪里，我都睡在音乐里。", typeKey: HTDiscoverRecommendVipType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "f62c84a446f9850ce69aaba24b25ba4e", selectedImageKey: "9ce003c324136d8cfc2bba0653e3b779", selectedKey: false, infoTypeKey: "歌单", infoTitleKey: "乘车助眠 听完秒睡系列", infoDetailKey: "云音乐VIP", infoShowPlayKey: false],
			[titleKey: "来自世界尽头的浪漫吟唱", typeKey: HTDiscoverRecommendVipType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "66e5d1138ec936e44376a4d8952dc09f", selectedImageKey: "4580dfc3600dc063894ac544382f1803", selectedKey: false, infoTypeKey: "歌单", infoTitleKey: "北欧女声°梦境别样性感", infoDetailKey: "云音乐VIP", infoShowPlayKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendVipModel in
			let model = HTDiscoverRecommendVipModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendVipType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.infoType = dictionary[infoTypeKey] as? String
			model.infoTitle = dictionary[infoTitleKey] as? String
			model.infoDetail = dictionary[infoDetailKey] as? String
			model.infoShowPlay = dictionary[infoShowPlayKey] as? Bool
			return model
		}
		return modelArray
	}
}
