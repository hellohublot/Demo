//
//  HTCourseCircleModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCourseCircleType {
	case `default`
}

class HTCourseCircleModel: NSObject {
	
	var title: String?
	var type: HTCourseCircleType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTCourseCircleModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "公开课", typeKey: HTCourseCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "f7d231b47a18df745b075d57e60e1ab8", selectedImageKey: "", selectedKey: false],
			[titleKey: "精品课程", typeKey: HTCourseCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b1fbe48647a09f78fef88c06b0033544", selectedImageKey: "", selectedKey: false],
			[titleKey: "名师一览", typeKey: HTCourseCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "e8af6b3dfcde341a76e5d6894311cdf8", selectedImageKey: "", selectedKey: false],
			[titleKey: "学员故事", typeKey: HTCourseCircleType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "3a414042fe07f984a8cc913d33ff275b", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCourseCircleModel in
			let model = HTCourseCircleModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCourseCircleType
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
