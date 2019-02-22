//
//  HTExerciseHardModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/5.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTExerciseHardType {
	case `default`
}

class HTExerciseHardModel: NSObject {
	
	var title: String?
	var type: HTExerciseHardType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTExerciseHardModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "OG - 难", typeKey: HTExerciseHardType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "0d2cdb44e73fbd402f898b74dc721e47", selectedImageKey: "", selectedKey: false],
			[titleKey: "OG - 中", typeKey: HTExerciseHardType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "b91729b3cb9eebfdd3add4772e9644bc", selectedImageKey: "", selectedKey: false],
			[titleKey: "OG - 易", typeKey: HTExerciseHardType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "2d440e52cb9be4af80e9c12a60cb56a9", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTExerciseHardModel in
			let model = HTExerciseHardModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTExerciseHardType
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
