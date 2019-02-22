//
//  HTCourseStoryModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCourseStoryType {
	case `default`
}

class HTCourseStoryModel: NSObject {
	
	var title: String?
	var type: HTCourseStoryType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var studentImage: String?
	var studentTitle: String?
	var studentDate: String?
	var scoreTitleList = [String]()
	
	class func packModelArray() -> [HTCourseStoryModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let studentImageKey = "studentImageKey"
		let studentTitleKey = "studentTitleKey"
		let studentDateKey = "studentDateKey"
		let scoreTitleListKey = "scoreTitleListKey"
		
		let keyValueArray = [
			[titleKey: "", typeKey: HTCourseStoryType.default, textKey: "我是在职学习，时间很有限，三战成绩分别是620-690-710。SC方面我主要是看曼哈顿，刷gwd prep OG中没做过的题，三战期间上了勇哥的课，把知识点从头到尾又串了一遍，感觉收获很大，比自己一个人备考好太多！", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, studentImageKey: "50c974beb5e3d0bd0e4952a9c4ef8e99", studentTitleKey: "xiaoliuse429", studentDateKey: "2016年11月学员", scoreTitleListKey: ["总成绩710", "总成绩提分20"]],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCourseStoryModel in
			let model = HTCourseStoryModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCourseStoryType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
            
            
            model.studentImage = dictionary[studentImageKey] as? String
            model.studentTitle = dictionary[studentTitleKey] as? String
            model.studentDate = dictionary[studentDateKey] as? String
            model.scoreTitleList = (dictionary[scoreTitleListKey] as? [String] ?? [String]())

			return model
		}
		return modelArray
	}
}
