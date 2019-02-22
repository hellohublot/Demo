//
//  HTExerciseGuideModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTExerciseGuideType {
	case `default`
}

class HTExerciseGuideModel: NSObject {
	
	var title: String?
	var type: HTExerciseGuideType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTExerciseGuideModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "备考指南 Prep Guide", typeKey: HTExerciseGuideType.default, textKey: "帮您快速了解关于GMAT考试的一切", controllerClassKey: UIViewController.self, imageKey: "b2f24199598c7d9508b63a46ad02208c", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTExerciseGuideModel in
			let model = HTExerciseGuideModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTExerciseGuideType
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
