//
//  HTCourseReplayModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCourseReplayType {
	case `default`
}

class HTCourseReplayModel: NSObject {
	
	var title: String?
	var type: HTCourseReplayType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var flagImage: String?
	var flagTitle: String?
	var teacherTitle: String?
	var teacherImage: String?
	var teacherHeadImage: String?
	var teacherVisitCount: String?
	var teacherLikeCount: String?
	
	
	class func packModelArray() -> [HTCourseReplayModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let flagImageKey = "flagImageKey"
		let flagTitleKey = "flagTitleKey"
		let teacherTitleKey = "teacherTitleKey"
		let teacherImageKey = "teacherImageKey"
		let teacherHeadImageKey = "teacherHeadImageKey"
		let teacherVisitCountKey = "teacherVisitCountKey"
		let teacherLikeCountKey = "teacherLikeCountKey"
		
		let keyValueArray = [
			[titleKey: "让人头疼的比率&&倍数问题", typeKey: HTCourseReplayType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, flagImageKey: "3b2d467a9486e34d1e3c7fbefde53578", flagTitleKey: "GMAT数学", teacherTitleKey: "杨雅坤", teacherImageKey: "27a7c8c7a763bd339c0474ff491a39df", teacherHeadImageKey: "19a7a4df3d713d2b419fa38e6a9d3720", teacherVisitCountKey: "622", teacherLikeCountKey: "51"],
			[titleKey: "那些经常因为你不认识而被误排的表达", typeKey: HTCourseReplayType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, flagImageKey: "bb1095cd4fd7096266d7755b663ab754", flagTitleKey: "GMAT语法", teacherTitleKey: "侯乃武", teacherImageKey: "27a7c8c7a763bd339c0474ff491a39df", teacherHeadImageKey: "a6da27ead83b738711d321944a91013b", teacherVisitCountKey: "759", teacherLikeCountKey: "67"],
			[titleKey: "还原CR题的现实场景--从中美贸易战看进出口关税", typeKey: HTCourseReplayType.default, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, flagImageKey: "2a533473593fd94b9fca450eeaf6988e", flagTitleKey: "GMAT逻辑", teacherTitleKey: "李耀东", teacherImageKey: "27a7c8c7a763bd339c0474ff491a39df", teacherHeadImageKey: "ca5d185c1277e885a01914d1dd1dab98", teacherVisitCountKey: "611", teacherLikeCountKey: "39"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCourseReplayModel in
			let model = HTCourseReplayModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCourseReplayType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			
			model.flagImage = dictionary[flagImageKey] as? String
			model.flagTitle = dictionary[flagTitleKey] as? String
			model.teacherTitle = dictionary[teacherTitleKey] as? String
			model.teacherImage = dictionary[teacherImageKey] as? String
			model.teacherHeadImage = dictionary[teacherHeadImageKey] as? String
			model.teacherVisitCount = dictionary[teacherVisitCountKey] as? String
			model.teacherLikeCount = dictionary[teacherLikeCountKey] as? String

			return model
		}
		return modelArray
	}
}
