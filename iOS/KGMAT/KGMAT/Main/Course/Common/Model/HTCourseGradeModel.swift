//
//  HTCourseGradeModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCourseGradeType {
	case `default`
}

class HTCourseGradeModel: NSObject {
	
	var title: String?
	var type: HTCourseGradeType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var detail: String?
	
	class func packModelArray() -> [HTCourseGradeModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let detailKey = "detailKey"
		
		let keyValueArray = [
			[titleKey: "All in One", typeKey: HTCourseGradeType.default, textKey: "TOEFL®/ IELTS / GRE®/ GMAT", controllerClassKey: UIViewController.self, imageKey: "9f715260c471cc7788bcb79ee2ca2e38", selectedImageKey: "", selectedKey: false, detailKey: "全程督导冲分班"],
			[titleKey: "VIP 6 人", typeKey: HTCourseGradeType.default, textKey: "TOEFL®", controllerClassKey: UIViewController.self, imageKey: "14b40f3cfc0477dcce1e4ecd7bbce91f", selectedImageKey: "", selectedKey: false, detailKey: "定制金牌班"],
			[titleKey: "VIP 1 对 1", typeKey: HTCourseGradeType.default, textKey: "GRE®/ GMAT", controllerClassKey: UIViewController.self, imageKey: "e668c6e102b807bdc12f451a37c098b1", selectedImageKey: "", selectedKey: false, detailKey: "特训班"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCourseGradeModel in
			let model = HTCourseGradeModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCourseGradeType
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
