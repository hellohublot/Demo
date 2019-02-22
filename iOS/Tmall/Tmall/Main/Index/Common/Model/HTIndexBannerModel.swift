//
//  HTIndexBannerModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/21.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTIndexBannerType {
	case `default`
}

class HTIndexBannerModel: NSObject {
	
	var title: String?
	var type: HTIndexBannerType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: UIImage?
	var selectedImage: UIImage?
	var selected: Bool?
	var tintColor: UIColor?
	
	class func packModelArray() -> [HTIndexBannerModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let tintColorKey = "tintColorKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "2ebe31410f635a28da55f4b26eef3394"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 45 / 255.0, green: 88 / 255.0, blue: 211 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "3c3eb650ae12737f49f4d34a82b68baa"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 152 / 255.0, green: 120 / 255.0, blue: 252 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "5a4269e968d5f64dfaf2c44c1b9c1c0b"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 183 / 255.0, green: 33 / 255.0, blue: 68 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "5bad995c1cfd7998437349598d1934d5"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 181 / 255.0, green: 59 / 255.0, blue: 57 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "5da804cbee6842d829c59ba75a5cf99f"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 232 / 255.0, green: 232 / 255.0, blue: 232 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "7d469aad77b1ca78930a7b1f43d438b3"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 253 / 255.0, green: 226 / 255.0, blue: 235 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "15ecf003559ed4e2693c95ff2d6bab10"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 228 / 255.0, green: 63 / 255.0, blue: 46 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "ab53bbe8d8a92c5e93aaf3f3e5b0f324"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 100 / 255.0, green: 204 / 255.0, blue: 240 / 255.0, alpha: 1)],
			[titleKey: "", typeKey: HTIndexBannerType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: UIImage.init(named: "bee2d8a42319d66002603cd2104fb596"), selectedImageKey: nil, selectedKey: false, tintColorKey: UIColor.init(red: 255 / 255.0, green: 179 / 255.0, blue: 115 / 255.0, alpha: 1)],
		]
		let modelArray = keyValueArray.map { dictionary -> HTIndexBannerModel in
			let model = HTIndexBannerModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTIndexBannerType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? UIImage
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? UIImage
			model.tintColor = dictionary[tintColorKey] as? UIColor
			return model
		}
		return modelArray
	}
}
