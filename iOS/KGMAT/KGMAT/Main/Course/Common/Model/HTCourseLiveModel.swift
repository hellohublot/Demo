//
//  HTCourseLiveModel.swift
//  KGMAT
//
//  Created by hublot on 2018/12/4.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit

enum HTCourseLiveType {
	case `default`
}

class HTCourseLiveModel: NSObject {
	
	var title: String?
	var type: HTCourseLiveType?
	var text: NSAttributedString?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var liveTime: String?
	var flagTitle: String?
	var flagImage: String?
	var teacherImage: String?
	var teacherTitle: String?
    	
	class func packModelArray() -> [HTCourseLiveModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		
		let liveTimeKey = "liveTimeKey"
		let flagTitleKey = "flagTitleKey"
		let flagImageKey = "flagImageKey"
		let teacherImageKey = "teacherImageKey"
		let teacherTitleKey = "teacherTitleKey"
		
		let keyValueArray = [
			[titleKey: "遇见“黑脸题”如何不再黑脸？----黑脸题必知的做题技巧", typeKey: HTCourseLiveType.default, textKey: "Boldface“黑脸题”，是让很多同学非常头痛的题目。做题速度慢！做得快又保证不了准确率！“文章太长，读不完文章怎么破？”“每个选项描述都差不多，怎么区分？”不会总结，刷再多题也是白搭。文章虽长，选项虽抽象，但老司机依然套路满满。一节公开课，萌奇老师教你学会好好利用做过的题，掌握技巧和方法，快速解决boldface题，从此以后不再黑脸。", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, liveTimeKey: "20:00", flagTitleKey: "GMAT逻辑", flagImageKey: "2a533473593fd94b9fca450eeaf6988e", teacherImageKey: "4b8f0287d9c49ec0b9c6312bab4a6d96", teacherTitleKey: "姜梦奇老师"],
            [titleKey: "写作7+，是如何做到的？", typeKey: HTCourseLiveType.default, textKey: "写作7+，是如何做到的？", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false, liveTimeKey: "10:30", flagTitleKey: "雅思写作", flagImageKey: "3b2d467a9486e34d1e3c7fbefde53578", teacherImageKey: "54a778c5d5307dfe1588a420dda2a875", teacherTitleKey: "李净尘老师"],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCourseLiveModel in
			let model = HTCourseLiveModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCourseLiveType
            model.text = {
                let paragraphStyle = NSMutableParagraphStyle.init()
                paragraphStyle.lineSpacing = 5
                let attributedString = NSAttributedString.init(string: (dictionary[textKey] as? String) ?? "", attributes: [
                    .font: UIFont.systemFont(ofSize: 14),
                    .foregroundColor: UIColor.init(red: 0.64, green: 0.64, blue: 0.64, alpha: 1),
                    .paragraphStyle: paragraphStyle
                ])
                return attributedString
            }()
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			
			model.liveTime = dictionary[liveTimeKey] as? String
			model.flagImage = dictionary[flagImageKey] as? String
			model.flagTitle = dictionary[flagTitleKey] as? String
			model.teacherTitle = dictionary[teacherTitleKey] as? String
			model.teacherImage = dictionary[teacherImageKey] as? String
			return model
		}
		return modelArray
	}
}
