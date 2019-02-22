//
//  HTExerciseCountModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTExerciseCountType {
	case `default`
}

class HTExerciseCountModel: NSObject {
	
	var title: String?
	var type: HTExerciseCountType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	var detail: String?
	
	class func packModelArray() -> [HTExerciseCountModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let detailKey = "detailKey"
		let keyValueArray = [
			[titleKey: "0", typeKey: HTExerciseCountType.default, textKey: "今日做题", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: "道"],
			[titleKey: "34", typeKey: HTExerciseCountType.default, textKey: "累计做题", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: "道"],
			[titleKey: "1", typeKey: HTExerciseCountType.default, textKey: "累计学习", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, detailKey: "天"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTExerciseCountModel in
			let model = HTExerciseCountModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTExerciseCountType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.detail = dictionary[detailKey] as? String
			return model
		}
		return modelArray
	}
}
