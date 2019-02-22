//
//  HTMineSectionModel.swift
//  Music163
//
//  Created by hublot on 2018/12/11.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTMineSectionType {
	case record
	case create
	case recommend
}

class HTMineSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var type: HTMineSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTMineSectionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "", typeKey: HTMineSectionType.record, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "我创建的歌单(1)", typeKey: HTMineSectionType.create, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
			[titleKey: "推荐歌单", typeKey: HTMineSectionType.recommend, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTMineSectionModel in
			let model = HTMineSectionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTMineSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .record?:
				model.modelArray = HTMineRecordModel.packModelArray()
			case .create?:
				model.modelArray = HTMineCreateModel.packModelArray()
			case .recommend?:
				model.modelArray = HTMineRecommendModel.packModelArray()
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
