//
//  HTDiscoverRecommendCircleModel.swift
//  Music163
//
//  Created by hublot on 2018/12/12.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTDiscoverRecommendCircleType {
	case `default`
}

class HTDiscoverRecommendCircleModel: NSObject {
	
	var title: String?
	var type: HTDiscoverRecommendCircleType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTDiscoverRecommendCircleModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "私人FM", typeKey: HTDiscoverRecommendCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "96a4ef8c35677d7ada91d4204d83b1cd", selectedImageKey: "", selectedKey: false],
			[titleKey: "每日推荐", typeKey: HTDiscoverRecommendCircleType.default, textKey: "\(Calendar.current.component(.day, from: Date()))", controllerClassKey: UIViewController.self, imageKey: "dd6c5798a48fab3b61fbfdac3dc94f07", selectedImageKey: "", selectedKey: false],
			[titleKey: "歌单", typeKey: HTDiscoverRecommendCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "7c1ab3edddec4d9c2184b3f8fe7d8b81", selectedImageKey: "", selectedKey: false],
			[titleKey: "排行榜", typeKey: HTDiscoverRecommendCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "5206b3c18415f71e2cc75839214bef31", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTDiscoverRecommendCircleModel in
			let model = HTDiscoverRecommendCircleModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTDiscoverRecommendCircleType
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
