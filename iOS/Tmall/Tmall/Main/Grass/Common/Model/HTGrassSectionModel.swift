//
//  HTGrassSectionModel.swift
//  Tmall
//
//  Created by hublot on 2018/11/27.
//  Copyright © 2018 hublot. All rights reserved.
//

import UIKit
import HTSwift

enum HTGrassSectionType {
	case `discover`
}

class HTGrassSectionModel: NSObject, ReuseSectionArray {
	
	var title: String?
	var type: HTGrassSectionType?
	var text: String?
	var controllerClass: UIViewController.Type?
	var image: String?
	var selectedImage: String?
	var selected: Bool?
	
	var modelArray = [Any]()
	
	class func packModelArray() -> [HTGrassSectionModel] {
		let titleKey = "titleKey"
		let typeKey = "typeKey"
		let textKey = "textKey"
		let controllerClassKey = "controllerClassKey"
		let imageKey = "imageKey"
		let selectedImageKey = "selectedImageKey"
		let selectedKey = "selectedKey"
		let keyValueArray = [
			[titleKey: "每日都有新发现", typeKey: HTGrassSectionType.discover, textKey: "", controllerClassKey: UIViewController.self, imageKey: "", selectedImageKey: "", selectedKey: false],
		]
		let modelArray = keyValueArray.map { dictionary -> HTGrassSectionModel in
			let model = HTGrassSectionModel()
			model.title = dictionary[titleKey] as? String
			model.type = dictionary[typeKey] as? HTGrassSectionType
			model.text = dictionary[textKey] as? String
			model.controllerClass = dictionary[controllerClassKey] as? UIViewController.Type
			model.image = dictionary[imageKey] as? String
			model.selected = dictionary[selectedKey] as? Bool
			model.selectedImage = dictionary[selectedImageKey] as? String
			switch model.type {
			case .discover?:
				model.modelArray = HTGrassDiscoverModel.packModelArray()
			default:
				break
			}
			return model
		}
		return modelArray
	}
}
