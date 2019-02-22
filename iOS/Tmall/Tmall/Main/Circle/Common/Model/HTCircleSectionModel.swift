//
//  HTCircleSectionModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTCircleSectionType {
	case activity
	case recommend
}

class HTCircleSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var type: HTCircleSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var detail: String?
	
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTCircleSectionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let detailKey = "detailKey"
		let keyValueArray = [
			[titleKey: "", detailKey: "", typeKey: HTCircleSectionType.activity, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "今日推荐", detailKey: "更多热门精彩活动", typeKey: HTCircleSectionType.recommend, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTCircleSectionModel in
			let model = HTCircleSectionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTCircleSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			model.detail = dictionary[detailKey] as? String
			switch model.type {
			case .activity?:
				model.modelArray = HTCircleActivityModel.packModelArray()
			case .recommend?:
				model.modelArray = HTCircleRecommendModel.packModelArray()
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
