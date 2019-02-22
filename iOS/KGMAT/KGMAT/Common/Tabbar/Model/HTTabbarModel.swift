//
//  HTTabbarModel.swift
//  Tian
//
//  Created by hublot on 2018/11/19.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTTabbarType {
	case exercise
	case course
	case question
	case mine
}

class HTTabbarModel: NSObject {
	
	var title: String?
	var type: HTTabbarType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTTabbarModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
            [titleKey: "练习", typeKey: HTTabbarType.exercise, textKey: "", controllerClassKey: HTExerciseController.self, imageKey: "c0bfe5552c9f729a7740e61edac203f3", selectedImageKey: "896760d62e36f6979db8e4f82a3c1456", selectedKey: false],
            [titleKey: "课程", typeKey: HTTabbarType.course, textKey: "", controllerClassKey: HTCourseController.self, imageKey: "97a420f489eda163106b3313487fd78f", selectedImageKey: "d8afc7ee3f361fa7a783f9b027dd2591", selectedKey: false],
            [titleKey: "题库", typeKey: HTTabbarType.question, textKey: "", controllerClassKey: HTQuestionController.self, imageKey: "c2c76ff3603e3ccd30929afe3f274f91", selectedImageKey: "2c9ba30a9429038dd503743b7ffe2a30", selectedKey: false],
            [titleKey: "我的", typeKey: HTTabbarType.mine, textKey: "", controllerClassKey: HTMineController.self, imageKey: "a09720dbcbe6f01be4154315d8568632", selectedImageKey: "5df4716a352398cebe9d7bfb7164eb37", selectedKey: false]
		]
		let modelArray = keyValueArray.map { dictionary -> HTTabbarModel in
			let model = HTTabbarModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTTabbarType
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
