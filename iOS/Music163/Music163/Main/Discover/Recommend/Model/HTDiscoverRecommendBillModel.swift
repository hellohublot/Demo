//
//  HTDiscoverRecommendBillModel.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendBillType {
	case `default`
}

class HTDiscoverRecommendBillModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendBillType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTDiscoverRecommendBillModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "你打算什么时候去见那个超级想见的人啊", typeKey: HTDiscoverRecommendBillType.default, textKey: "76万", controllerClassKey: UIViewController.self, imageKey: "609c43d6d4bb18b1bf8d7b9b36a50ad0", selectedImageKey: "", selectedKey: false],
			[titleKey: "抛开理性 潜入妄想状态", typeKey: HTDiscoverRecommendBillType.default, textKey: "12万", controllerClassKey: UIViewController.self, imageKey: "c5d19844923c84bb2b5164afd88eef86", selectedImageKey: "", selectedKey: false],
			[titleKey: "一个双子座的听歌列表", typeKey: HTDiscoverRecommendBillType.default, textKey: "1552万", controllerClassKey: UIViewController.self, imageKey: "cda93e481404761d578a8c18d5d6487a", selectedImageKey: "", selectedKey: false],
			[titleKey: "表面很多人喜欢，其实孤独的连猫都没有", typeKey: HTDiscoverRecommendBillType.default, textKey: "474万", controllerClassKey: UIViewController.self, imageKey: "ea6986b13629995f48c035d945e40634", selectedImageKey: "", selectedKey: false],
			[titleKey: "［经典民谣］不止南山南", typeKey: HTDiscoverRecommendBillType.default, textKey: "383万", controllerClassKey: UIViewController.self, imageKey: "132b0b1c7aba68538570ed07235ba313", selectedImageKey: "", selectedKey: false],
			[titleKey: "攒了一大堆好听的歌想和你一起听", typeKey: HTDiscoverRecommendBillType.default, textKey: "4327万", controllerClassKey: UIViewController.self, imageKey: "c52a0c4368ed015202f5867543151503", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendBillModel in
			let model = HTDiscoverRecommendBillModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendBillType
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
