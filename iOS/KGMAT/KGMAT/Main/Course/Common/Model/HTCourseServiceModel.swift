//
//  HTCourseServiceModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCourseServiceType {
	case `default`
}

class HTCourseServiceModel: NSObject {
	
	var title: String?
	var type: HTCourseServiceType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	class func packModelArray() -> [HTCourseServiceModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "无条件退款", typeKey: HTCourseServiceType.default, textKey: "课前课中不满可无条件退款", controllerClassKey: UIViewController.self, imageKey: "afc94f1ee92f8d90d9778cb38bd1a7b2", selectedImageKey: "", selectedKey: false],
			[titleKey: "随时随地学习", typeKey: HTCourseServiceType.default, textKey: "线上课程打破时空，尽享酷学时光", controllerClassKey: UIViewController.self, imageKey: "7141c6b95b42a67833359aa02034675d", selectedImageKey: "", selectedKey: false],
			[titleKey: "实时响应答疑", typeKey: HTCourseServiceType.default, textKey: "7 * 24小时实时互动精准答疑", controllerClassKey: UIViewController.self, imageKey: "3369d033235440e4d30514a6518ecd2f", selectedImageKey: "", selectedKey: false],
			[titleKey: "学习测评报告", typeKey: HTCourseServiceType.default, textKey: "智能化数据分析，个性化针对练习", controllerClassKey: UIViewController.self, imageKey: "10d0426e4977e933a08663980c6a6201", selectedImageKey: "", selectedKey: false],
			[titleKey: "混合式教学", typeKey: HTCourseServiceType.default, textKey: "教学练答管，一站式教学与服务", controllerClassKey: UIViewController.self, imageKey: "8f1411488ef3ba6290ea84bff5db82da", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCourseServiceModel in
			let model = HTCourseServiceModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCourseServiceType
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
