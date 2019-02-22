//
//  HTIndexCircleModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexCircleType {
	case easy
	case market
	case country
	case cheap
	case weal
	case free
	case packet
	case fans
	case invite
	case category
}

class HTIndexCircleModel: NSObject {
	
	var title: String?
	var type: HTIndexCircleType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTIndexCircleModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "苏宁易购", typeKey: HTIndexCircleType.easy, textKey: "", controllerClassKey: UIViewController.self, imageKey: "1ec28231343a77f2f77808d518517e8a", selectedImageKey: "", selectedKey: false],
			[titleKey: "天猫超市", typeKey: HTIndexCircleType.market, textKey: "", controllerClassKey: UIViewController.self, imageKey: "29bade81f6f8a53dab716aad677c2724", selectedImageKey: "", selectedKey: false],
			[titleKey: "天猫国际", typeKey: HTIndexCircleType.country, textKey: "", controllerClassKey: UIViewController.self, imageKey: "2f836b220bfe2088cb19027d58ebef21", selectedImageKey: "", selectedKey: false],
			[titleKey: "聚划算", typeKey: HTIndexCircleType.cheap, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b8cf941bc91474a7e570fe49e2df2155", selectedImageKey: "", selectedKey: false],
			[titleKey: "福利雷达", typeKey: HTIndexCircleType.weal, textKey: "", controllerClassKey: UIViewController.self, imageKey: "6a0fbd29a986bf89ac18fa59b7291258", selectedImageKey: "", selectedKey: false],
			[titleKey: "免费领水果", typeKey: HTIndexCircleType.free, textKey: "", controllerClassKey: UIViewController.self, imageKey: "da4ac6daa0b37271e7ff2a355db13783", selectedImageKey: "", selectedKey: false],
			[titleKey: "积分兑红包", typeKey: HTIndexCircleType.packet, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e2ba1a3f7ffd66e7299297fa50132ba9", selectedImageKey: "", selectedKey: false],
			[titleKey: "粉丝福利社", typeKey: HTIndexCircleType.fans, textKey: "", controllerClassKey: UIViewController.self, imageKey: "05620ef04b3f13b20a98a4a99592e5e1", selectedImageKey: "", selectedKey: false],
			[titleKey: "邀请赚红包", typeKey: HTIndexCircleType.invite, textKey: "", controllerClassKey: UIViewController.self, imageKey: "2dca4c158530951b1ea3a9662f40de11", selectedImageKey: "", selectedKey: false],
			[titleKey: "分类", typeKey: HTIndexCircleType.category, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b3fbdd462b06db8f1df8de008810fc26", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexCircleModel in
			let model = HTIndexCircleModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexCircleType
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
